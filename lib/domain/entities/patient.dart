import 'package:equatable/equatable.dart';

class Patient extends Equatable {
  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime dateOfBirth;
  final int age;
  final String gender;
  final String phoneNumber;
  final String email;
  final String patientAccountId;
  final String affiliation;
  final String affiliationDisplay;
  final String militaryUnit;
  final String militaryRank;
  final String serialNumber;
  final String department;
  final String position;
  final String? profilePicture;
  final String? profilePictureUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Patient({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.dateOfBirth,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.patientAccountId,
    required this.affiliation,
    required this.affiliationDisplay,
    required this.militaryUnit,
    required this.militaryRank,
    required this.serialNumber,
    required this.department,
    required this.position,
    this.profilePicture,
    this.profilePictureUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  String get fullName => '$firstName $middleName $lastName';

  @override
  List<Object?> get props => [
        id,
        firstName,
        middleName,
        lastName,
        dateOfBirth,
        age,
        gender,
        phoneNumber,
        email,
        patientAccountId,
        affiliation,
        affiliationDisplay,
        militaryUnit,
        militaryRank,
        serialNumber,
        department,
        position,
        profilePicture,
        profilePictureUrl,
        createdAt,
        updatedAt,
      ];
}
