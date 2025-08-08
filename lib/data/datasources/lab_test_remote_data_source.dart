import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../models/lab_test_model.dart';
import '../../domain/entities/lab_test.dart';

class LabTestRemoteDataSource {
  final Dio dio;
  LabTestRemoteDataSource(this.dio);

  Future<List<LabTest>> getLabTests(String accessToken, String type) async {
    final response = await dio.get(
      '${ApiConstants.baseUrl}/patients/me/lab-tests/?type=$type',
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
    final data = response.data as List;
    switch (type) {
      case 'fecalysis':
        return data.map((json) => FecalysisLabTestModel.fromJson(json)).toList();
      case 'pregnancy-test':
        return data.map((json) => PregnancyLabTestModel.fromJson(json)).toList();
      case 'chemistry':
        return data.map((json) => ChemistryLabTestModel.fromJson(json)).toList();
      case 'serology':
        return data.map((json) => SerologyLabTestModel.fromJson(json)).toList();
      case 'urinalysis':
        return data.map((json) => UrinalysisLabTestModel.fromJson(json)).toList();
      case 'ogtt':
        return data.map((json) => OgttLabTestModel.fromJson(json)).toList();
      case 'cbc':
        return data.map((json) => CbcLabTestModel.fromJson(json)).toList();
      default:
        return [];
    }
  }
}
