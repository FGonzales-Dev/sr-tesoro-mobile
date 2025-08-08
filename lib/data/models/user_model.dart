import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String username,
    required String firstName,
    required String lastName,
    required String accessToken,
  }) : super(
          id: id,
          username: username,
          firstName: firstName,
          lastName: lastName,
          accessToken: accessToken,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['id'],
      username: json['user']['username'],
      firstName: json['user']['first_name'],
      lastName: json['user']['last_name'],
      accessToken: json['access'],
    );
  }
}
