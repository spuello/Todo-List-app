import 'package:todo/common/errors/app_errors.dart';
import 'package:todo/features/todo/repositories/todo_repository.dart'; // Import your TodoRepository

import '../../../data/models/todo_model.dart';
import '../../../domain/usecase.dart';

class FetchAllTodos
    extends Usecase<Future<UsecaseResult<List<TodoModel>>>, void> {
  final TodoRepository todoRepo;

  const FetchAllTodos({
    required this.todoRepo,
  });

  @override
  Future<UsecaseResult<List<TodoModel>>> execute(
      {required void request}) async {
    try {
      final todos = await todoRepo.getAll();
      return UsecaseResult.success(todos);
    } catch (e) {
      return UsecaseResult.fail(AppErrors.commonError);
    }
  }
}
