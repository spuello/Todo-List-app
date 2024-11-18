import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/common/errors/app_errors.dart';
import 'package:todo/domain/usecase.dart';
import 'package:todo/features/signin/presentation/bloc/sign_in_bloc.dart';

import '../../../../mocks.dart';

void main() {
  late final MockSignIn mockSignIn;

  setUpAll(() {
    registerFallbackValue(FakeSignInSignInRequest());
    mockSignIn = MockSignIn();
  });

  SignInBloc buildBloc() => SignInBloc(signInUsecase: mockSignIn);

  final tSignInRequest = SignInSubmitted(
    email: "spuellocoronado@gmail.com",
    password: "Pass#123",
  );

  group("SignInRequested", () {
    blocTest<SignInBloc, SignInState>(
        'emits [SignInLoading, SignInSuccess] when valid email and password are provided',
        build: buildBloc,
        setUp: () {
          when(() => mockSignIn.execute(request: any(named: "request")))
              .thenAnswer((_) async {
            return UsecaseResult.success();
          });
        },
        act: (bloc) {
          bloc.add(tSignInRequest);
        },
        expect: () => [isA<SignInLoading>(), isA<SignInSuccess>()],
        verify: (_) {
          verify(() => mockSignIn.execute(request: any(named: "request")))
              .called(1);
          verifyNoMoreInteractions(mockSignIn);
        });

    blocTest<SignInBloc, SignInState>(
        'emits [SignInLoading, SignInFailure] when invalid email or password is provided',
        build: buildBloc,
        setUp: () {
          when(() => mockSignIn.execute(request: any(named: "request")))
              .thenAnswer((_) async {
            return UsecaseResult.fail(AppErrors.loginFailed);
          });
        },
        act: (bloc) {
          bloc.add(tSignInRequest);
        },
        expect: () => [
              isA<SignInLoading>(),
              isA<SignInFailure>()
                  .having((p0) => p0.message, "message", isNotEmpty)
            ],
        verify: (_) {
          verify(() => mockSignIn.execute(request: any(named: "request")))
              .called(1);
          verifyNoMoreInteractions(mockSignIn);
        });
  });
}
