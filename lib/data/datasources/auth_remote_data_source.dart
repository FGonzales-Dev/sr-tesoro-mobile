import '../models/user_model.dart';
import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<UserModel> login(String patientAccountId, String password) async {
    try {
      final response = await dio.post(
        ApiConstants.login,
        data: {
          'patient_account_id': patientAccountId,
          'password': password,
        },
      );
      
      print('Response data: ${response.data}'); // Debug print
      
      if (response.data == null) {
        throw Exception('Response data is null');
      }

      if (!response.data.containsKey('user')) {
        throw Exception('Response missing user data');
      }

      return UserModel.fromJson(response.data);
    } catch (e) {
      print('Login error: $e'); // Debug print
      rethrow;
    }
  }
}
