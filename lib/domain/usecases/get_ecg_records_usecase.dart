import '../entities/ecg_record.dart';

abstract class GetEcgRecordsUseCase {
  Future<List<EcgRecord>> getEcgRecords(String accessToken);
}
