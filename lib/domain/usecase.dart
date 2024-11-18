import 'package:equatable/equatable.dart';

abstract class Usecase<Result, Request> {
  const Usecase();

  Result execute({required Request request});
}

class UsecaseResult<T> with EquatableMixin {
  final bool success;
  final T? data;
  final String? errorInfo;

  UsecaseResult._({required this.success, this.data, this.errorInfo});

  factory UsecaseResult.success([T? data]) {
    return UsecaseResult._(success: true, data: data);
  }

  factory UsecaseResult.fail(String? err) {
    return UsecaseResult._(success: false, errorInfo: err);
  }

  @override
  List<Object?> get props => [success, data, errorInfo];
}
