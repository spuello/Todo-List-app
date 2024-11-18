import 'package:drift/drift.dart';

import '../database/drift_database.dart';
import '../models/todo_model.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [Todos])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin {
  TodoDao(super.db);

  Future<int> remove(TodoModel data) async {
    return await delete(todos).delete(data);
  }

  Future<List<TodoModel>> getAll() async {
    return await select(todos).get();
  }

  Future<int> insert(TodoModel data) async {
    return await into(todos).insert(data);
  }
}
