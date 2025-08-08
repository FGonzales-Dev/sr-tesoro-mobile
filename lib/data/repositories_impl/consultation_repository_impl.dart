import '../../domain/entities/consultation.dart';
import '../../domain/usecases/get_consultations_usecase.dart';
import '../datasources/consultation_remote_data_source.dart';

class ConsultationRepositoryImpl implements GetConsultationsUseCase {
  final ConsultationRemoteDataSource remoteDataSource;
  ConsultationRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Consultation>> getConsultations(String accessToken) async {
    return await remoteDataSource.getConsultations(accessToken);
  }
}
