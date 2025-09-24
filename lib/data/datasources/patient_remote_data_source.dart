import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../models/patient_model.dart';

class PatientRemoteDataSource {
  final Dio dio;

  PatientRemoteDataSource({required this.dio});

  Future<PatientModel> getPatientProfile(String accessToken) async {
    print('PatientRemoteDataSource: Fetching patient profile');
    print('PatientRemoteDataSource: URL: ${ApiConstants.patientProfile}');
    
    try {
      final response = await dio.get(
        ApiConstants.patientProfile,
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      print('PatientRemoteDataSource: Response status: ${response.statusCode}');
      print('PatientRemoteDataSource: Response data: ${response.data}');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final patient = PatientModel.fromJson(data);
        print('PatientRemoteDataSource: Patient profile loaded successfully');
        return patient;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Failed to load patient profile: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      print('PatientRemoteDataSource: DioException: ${e.message}');
      if (e.response != null) {
        print('PatientRemoteDataSource: Response data: ${e.response?.data}');
      }
      rethrow;
    } catch (e) {
      print('PatientRemoteDataSource: Generic error: $e');
      rethrow;
    }
  }
}
