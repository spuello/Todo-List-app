import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/common/errors/app_errors.dart';
import 'package:todo/domain/usecase.dart';
import 'package:todo/features/signin/usecase/sign_in.dart';
import 'package:todo/features/signin/usecase/sign_in_request.dart';

import '../../../mocks.dart';

void main() {
  late final SignIn sut;
  late final MockAuthRepository mockAuthRepo;
  setUpAll(() {
    mockAuthRepo = MockAuthRepository();
    sut = SignIn(authRepo: mockAuthRepo);
  });

  test('returns success for existing user with email and password', () async {
    final match = UsecaseResult.success();
    final request = SignInRequest(
        email: "spuellocoronado@gmail.com", password: "vacancy#123");

    when(() => mockAuthRepo.sigIn(
        email: any(named: "email"),
        password: any(named: "password"))).thenAnswer((_) async {
      return true;
    });

    final actual = await sut.execute(request: request);

    expect(actual, match);
    verify(() => mockAuthRepo.sigIn(
        email: any(named: "email"), password: any(named: "password")));
    verifyNoMoreInteractions(mockAuthRepo);
  });
  test('shows error message when login fails due to incorrect credentials',
      () async {
    final match = UsecaseResult.fail(AppErrors.loginFailed);

    final request = SignInRequest(
        email: "spuellocoronado@gmail.com", password: "vacancy#123");

    when(() => mockAuthRepo.sigIn(
        email: any(named: "email"),
        password: any(named: "password"))).thenAnswer((_) async {
      return false;
    });

    final actual = await sut.execute(request: request);

    expect(actual, match);
    verify(() => mockAuthRepo.sigIn(
        email: any(named: "email"), password: any(named: "password")));
    verifyNoMoreInteractions(mockAuthRepo);
  });
}
