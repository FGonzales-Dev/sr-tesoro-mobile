import 'package:dio/dio.dart';
import '../models/consultation_model.dart';
import '../../core/constants/api_constants.dart';

class ConsultationRemoteDataSource {
  final Dio dio;
  ConsultationRemoteDataSource(this.dio);

  Future<List<ConsultationModel>> getConsultations(String accessToken) async {
    final response = await dio.get(
      ApiConstants.consultations,
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
    final data = response.data as List;
    return data.map((json) => ConsultationModel.fromJson(json)).toList();
  }
}
