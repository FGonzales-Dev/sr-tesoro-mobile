import 'package:dio/dio.dart';
import '../models/ecg_record_model.dart';
import '../../core/constants/api_constants.dart';

class EcgRemoteDataSource {
  final Dio dio;
  EcgRemoteDataSource(this.dio);

  Future<List<EcgRecordModel>> getEcgRecords(String accessToken) async {
    final response = await dio.get(
      '${ApiConstants.baseUrl}/patients/me/ecg-records/',
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
    final data = response.data as List;
    return data.map((json) => EcgRecordModel.fromJson(json)).toList();
  }
}
