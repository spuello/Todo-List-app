import 'package:todo/data/daos/todo_dao.dart';
import 'package:todo/features/todo/repositories/todo_repository.dart';

import '../../../data/models/todo_model.dart';

class TodoRepositoryDbImpl implements TodoRepository {
  final TodoDao dao;

  const TodoRepositoryDbImpl({
    required this.dao,
  });

  @override
  Future<int> add(TodoModel todo) async {
    return await dao.insert(todo);
  }

  @override
  Future<List<TodoModel>> getAll() async {
    return await dao.getAll();
  }

  @override
  Future<int> remove(TodoModel todo) async {
    return await dao.remove(todo);
  }
}
