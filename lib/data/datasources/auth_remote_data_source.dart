import '../models/user_model.dart';
import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<UserModel> login(String username, String password) async {
    final response = await dio.post(
      ApiConstants.login,
      data: {
        'username': username,
        'password': password,
      },
    );
    return UserModel.fromJson(response.data);
  }
}
