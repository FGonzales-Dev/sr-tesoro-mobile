class User {
  final int id;
  final String patientAccountId;
  final String firstName;
  final String lastName;
  final String accessToken;

  User({
    required this.id,
    required this.patientAccountId,
    required this.firstName,
    required this.lastName,
    required this.accessToken,
  });
}
