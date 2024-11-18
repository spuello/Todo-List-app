import 'package:get_it/get_it.dart';
import 'package:todo/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:todo/features/signin/repositories/auth_repository.dart';
import 'package:todo/features/signin/repositories/auth_repository_local_db_impl.dart';
import 'package:todo/features/todo/presentation/todo_bloc.dart';
import 'package:todo/features/todo/usecase/fetch_all_todos.dart';

import 'data/daos/todo_dao.dart';
import 'data/database/drift_database.dart';
import 'features/signin/usecase/sign_in.dart';
import 'features/todo/repositories/todo_repository.dart';
import 'features/todo/repositories/todo_repository_db_impl.dart';
import 'features/todo/usecase/add_todo.dart';

final sl = GetIt.instance;

void init() {
  registerUsecasesAndRepositories();
  registerBlocs();
  registerDatabase();
}

void registerDatabase() {
  sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton(() => TodoDao(sl<AppDatabase>()));
}

void registerBlocs() {
  sl.registerFactory(() => SignInBloc(signInUsecase: sl<SignIn>()));
  sl.registerFactory(() => TodoBloc(
        fetchAllTodos: sl<FetchAllTodos>(),
        addTodoUsecase: sl<AddTodoUsecase>(),
      ));
}

void registerUsecasesAndRepositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryLocalDbImpl());
  sl.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryDbImpl(dao: sl<TodoDao>()));

  sl.registerFactory(() => SignIn(authRepo: sl<AuthRepository>()));
  sl.registerFactory(() => FetchAllTodos(todoRepo: sl<TodoRepository>()));
  sl.registerFactory(() => AddTodoUsecase(todoRepo: sl<TodoRepository>()));
}
