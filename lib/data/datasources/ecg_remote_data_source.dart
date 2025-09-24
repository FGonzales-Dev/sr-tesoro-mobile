import 'package:dio/dio.dart';
import '../models/ecg_record_model.dart';
import '../../core/constants/api_constants.dart';

class EcgRemoteDataSource {
  final Dio dio;
  EcgRemoteDataSource(this.dio);

  Future<List<EcgRecordModel>> getEcgRecords(String accessToken) async {
    try {
      print('Fetching ECG records from: ${ApiConstants.ecgRecords}');
      print('Using access token: ${accessToken.substring(0, 10)}...');
      
      final response = await dio.get(
        ApiConstants.ecgRecords,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      
      print('ECG API response status: ${response.statusCode}');
      print('ECG API response data: ${response.data}');
      
      if (response.data == null) {
        throw Exception('ECG API response data is null');
      }
      
      final data = response.data as List;
      print('ECG records count: ${data.length}');
      
      return data.map((json) => EcgRecordModel.fromJson(json)).toList();
    } catch (e) {
      print('ECG API error: $e');
      rethrow;
    }
  }
}
