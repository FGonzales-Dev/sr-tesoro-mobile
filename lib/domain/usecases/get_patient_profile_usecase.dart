import '../entities/patient.dart';

abstract class GetPatientProfileUseCase {
  Future<Patient> call(String accessToken);
}
