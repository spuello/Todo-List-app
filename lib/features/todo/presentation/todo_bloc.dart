import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/todo_model.dart';
import '../usecase/add_todo.dart';
import '../usecase/fetch_all_todos.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final FetchAllTodos fetchAllTodos;
  final AddTodoUsecase addTodoUsecase;

  TodoBloc({
    required this.fetchAllTodos,
    required this.addTodoUsecase,
  }) : super(TodoInitial()) {
    on<FetchTodos>(_onFetchTodos);
    on<AddTodo>(_onAddTodo);
  }

  FutureOr<void> _onFetchTodos(
      FetchTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final result = await fetchAllTodos.execute(request: null);
    emit(TodoLoaded(result.data!));
  }

  FutureOr<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final result = await addTodoUsecase.execute(request: event.todo);
    if (result.success) {
      final todos = await fetchAllTodos.execute(request: null);
      emit(TodoLoaded(todos.data!));
    }
  }
}
