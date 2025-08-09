import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements LoginUseCase {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User> login(String patientAccountId, String password) async {
    return await remoteDataSource.login(patientAccountId, password);
  }
}
