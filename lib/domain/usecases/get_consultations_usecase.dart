import '../entities/consultation.dart';

abstract class GetConsultationsUseCase {
  Future<List<Consultation>> getConsultations(String accessToken);
}
