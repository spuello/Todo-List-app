import 'package:mocktail/mocktail.dart';
import 'package:todo/features/signin/repositories/auth_repository.dart';
import 'package:todo/features/signin/usecase/sign_in.dart';
import 'package:todo/features/signin/usecase/sign_in_request.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockSignIn extends Mock implements SignIn {}

class FakeSignInSignInRequest extends Fake implements SignInRequest {}
