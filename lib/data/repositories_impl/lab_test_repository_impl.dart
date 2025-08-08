import '../../domain/entities/lab_test.dart';
import '../../domain/usecases/get_lab_tests_usecase.dart';
import '../datasources/lab_test_remote_data_source.dart';

class LabTestRepositoryImpl implements GetLabTestsUseCase {
  final LabTestRemoteDataSource remoteDataSource;
  LabTestRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<LabTest>> getLabTests(String accessToken, String type) async {
    return await remoteDataSource.getLabTests(accessToken, type);
  }
}
