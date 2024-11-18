import 'package:drift/drift.dart';

class TodoModel implements Insertable<TodoModel> {
  final String id;
  final bool isCompleted;
  final String content;
  final DateTime createdAt;

  const TodoModel({
    required this.id,
    required this.isCompleted,
    required this.content,
    required this.createdAt,
  });

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }
}
