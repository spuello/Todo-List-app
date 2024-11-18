part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class AddTodo extends TodoEvent {
  final String todo;

  AddTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final String todoId;

  DeleteTodo(this.todoId);
}

class FetchTodos extends TodoEvent {}
