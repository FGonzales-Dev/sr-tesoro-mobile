import '../entities/user.dart';

abstract class LoginUseCase {
  Future<User> login(String patientAccountId, String password);
}
