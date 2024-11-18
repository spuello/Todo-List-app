import '../../../data/models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getAll();

  Future<int> add(TodoModel todo);

  Future<int> remove(TodoModel todo);
}


