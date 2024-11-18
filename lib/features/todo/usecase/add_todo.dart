import 'package:todo/data/models/todo_model.dart';
import 'package:uuid/uuid.dart';

import '../../../common/errors/app_errors.dart';
import '../../../domain/usecase.dart';
import '../repositories/todo_repository.dart';

class AddTodoUsecase extends Usecase<Future<UsecaseResult>, String> {
  final TodoRepository todoRepo;

  AddTodoUsecase({required this.todoRepo});

  @override
  Future<UsecaseResult> execute({required String request}) async {
    final todo = TodoModel(
      id: Uuid().v4(),
      content: request,
      isCompleted: false,
      createdAt: DateTime.now(),
    );

    final result = await todoRepo.add(todo);

    if (result != -1) {
      return UsecaseResult.success();
    }
    return UsecaseResult.fail(AppErrors.commonError);
  }
}
