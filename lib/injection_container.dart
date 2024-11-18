import 'package:get_it/get_it.dart';
import 'package:todo/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:todo/features/signin/repositories/auth_repository.dart';
import 'package:todo/features/signin/repositories/auth_repository_local_db_impl.dart';


import 'features/signin/usecase/sign_in.dart';

final sl = GetIt.instance;

void init() {
  registerUsecasesAndServices();
  registerBlocs();
}

void registerBlocs() {
  sl.registerFactory(() => SignInBloc(signInUsecase: sl<SignIn>()));
}

void registerUsecasesAndServices() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryLocalDbImpl());
  sl.registerFactory(() => SignIn(authRepo: sl<AuthRepository>()));
}
