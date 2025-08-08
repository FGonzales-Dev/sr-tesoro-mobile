import '../entities/lab_test.dart';

abstract class GetLabTestsUseCase {
  Future<List<LabTest>> getLabTests(String accessToken, String type);
}
