import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/signin/repositories/auth_repository_local_db_impl.dart';

void main() {
  late AuthRepositoryLocalDbImpl authRepository;

  setUp(() {
    authRepository = AuthRepositoryLocalDbImpl();
  });

  group('AuthRepositoryLocalDbImpl', () {
    test('returns true when correct email and password are provided', () async {
      final result = await authRepository.sigIn(
          email: 'spuellocoronado@gmail.com', password: 'Pass#123');
      expect(result, true);
    });

    test('returns false when email is incorrect', () async {
      final result = await authRepository.sigIn(
          email: 'spuelo@gmail.com', password: 'Pass#123');
      expect(result, false);
    });

    test('returns false when password is incorrect', () async {
      final result = await authRepository.sigIn(
          email: 'spuellocoronado@gmail.com', password: 'pass#98');

      expect(result, false);
    });

    test('returns false when both email and password are incorrect', () async {
      final result = await authRepository.sigIn(
          email: 'spuello@gmail.com', password: 'pass#98');
      expect(result, false);
    });
  });
}
