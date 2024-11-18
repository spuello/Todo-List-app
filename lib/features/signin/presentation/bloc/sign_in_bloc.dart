import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo/features/signin/usecase/sign_in_request.dart';

import '../../usecase/sign_in.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignIn signInUsecase;

  SignInBloc({required this.signInUsecase}) : super(SignInInitial()) {
    on<SignInSubmitted>(_onSignInRequested);
  }

  FutureOr<void> _onSignInRequested(
      SignInSubmitted event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    final result = await signInUsecase.execute(
        request: SignInRequest(email: event.email, password: event.password));
    if (result.success) {
      emit(SignInSuccess());
    } else {
      emit(SignInFailure(message: result.errorInfo!));
    }
  }
}
