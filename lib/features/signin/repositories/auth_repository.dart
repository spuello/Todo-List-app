abstract class AuthRepository {
  Future<bool> sigIn({required String email, required String password});
}
