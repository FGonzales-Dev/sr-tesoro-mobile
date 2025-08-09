import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String patientAccountId,
    required String firstName,
    required String lastName,
    required String accessToken,
  }) : super(
          id: id,
          patientAccountId: patientAccountId,
          firstName: firstName,
          lastName: lastName,
          accessToken: accessToken,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      if (!json.containsKey('user') || 
          !json.containsKey('access') || 
          !json.containsKey('patient_account_id')) {
        throw Exception('Invalid response format: missing required fields');
      }

      final user = json['user'] as Map<String, dynamic>;
      
      if (!user.containsKey('id') || 
          !user.containsKey('first_name') ||
          !user.containsKey('last_name')) {
        throw Exception('Invalid user data format: missing required fields');
      }

      return UserModel(
        id: user['id'] as int,
        patientAccountId: json['patient_account_id'] as String,
        firstName: user['first_name'] as String,
        lastName: user['last_name'] as String,
        accessToken: json['access'] as String,
      );
    } catch (e) {
      print('Error parsing user data: $e');
      print('Received JSON: $json');
      rethrow;
    }
  }
}
