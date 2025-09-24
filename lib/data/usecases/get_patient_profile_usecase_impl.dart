import '../../domain/entities/patient.dart';
import '../../domain/usecases/get_patient_profile_usecase.dart';
import '../datasources/patient_remote_data_source.dart';

class GetPatientProfileUseCaseImpl implements GetPatientProfileUseCase {
  final PatientRemoteDataSource remoteDataSource;

  GetPatientProfileUseCaseImpl({required this.remoteDataSource});

  @override
  Future<Patient> call(String accessToken) {
    return remoteDataSource.getPatientProfile(accessToken);
  }
}
