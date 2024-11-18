part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {
  const SignInEvent();
}

class SignInSubmitted extends SignInEvent {
  final String email;
  final String password;

  const SignInSubmitted({
    required this.email,
    required this.password,
  });
}
