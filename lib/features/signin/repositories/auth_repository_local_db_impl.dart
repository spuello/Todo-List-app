import 'package:todo/features/signin/repositories/auth_repository.dart';

final Map<String, String> _cachedUsers = {
  "spuellocoronado@gmail.com": "Pass#123",
};

class AuthRepositoryLocalDbImpl implements AuthRepository {
  @override
  Future<bool> sigIn({required String email, required String password}) async {
    await Future.delayed(Duration(milliseconds: 3000));
    final user = _cachedUsers[email];
    print(user);
    return user != null && user == password;
  }
}
