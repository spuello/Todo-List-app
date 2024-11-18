import 'package:todo/common/errors/app_errors.dart';
import 'package:todo/features/signin/repositories/auth_repository.dart';
import 'package:todo/features/signin/usecase/sign_in_request.dart';

import '../../../domain/usecase.dart';

class SignIn extends Usecase<Future<UsecaseResult>, SignInRequest> {
  final AuthRepository authRepo;

  const SignIn({
    required this.authRepo,
  });

  @override
  Future<UsecaseResult> execute({required request}) async {
    final result =
        await authRepo.sigIn(email: request.email, password: request.password);

    if (result) {
      return UsecaseResult.success();
    }
    return UsecaseResult.fail(AppErrors.loginFailed);
  }
}
