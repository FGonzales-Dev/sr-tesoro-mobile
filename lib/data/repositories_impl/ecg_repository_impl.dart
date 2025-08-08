import '../../domain/entities/ecg_record.dart';
import '../../domain/usecases/get_ecg_records_usecase.dart';
import '../datasources/ecg_remote_data_source.dart';

class EcgRepositoryImpl implements GetEcgRecordsUseCase {
  final EcgRemoteDataSource remoteDataSource;
  EcgRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<EcgRecord>> getEcgRecords(String accessToken) async {
    return await remoteDataSource.getEcgRecords(accessToken);
  }
}
