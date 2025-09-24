class ApiConstants {
   static const String baseUrl = 'http://localhost:8080/api';
  // static const String baseUrl = 'https://tesoro-staging-4458c.ondigitalocean.app/api';
  static const String login = '$baseUrl/auth/login/';
  static const String consultations = '$baseUrl/patients/me/consultations/';
  static const String ecgRecords = '$baseUrl/patients/me/ecg-records/';
  static const String patientProfile = '$baseUrl/patients/me/profile/';
}
