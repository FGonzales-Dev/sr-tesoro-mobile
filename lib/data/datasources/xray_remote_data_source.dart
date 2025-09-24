import 'package:dio/dio.dart';
import '../../core/constants/api_constants.dart';
import '../../domain/entities/xray.dart';
import '../models/xray_model.dart';

class XrayRemoteDataSource {
  final Dio dio;

  XrayRemoteDataSource({required this.dio});

  Future<List<Xray>> getXrays(String accessToken) async {
    print('XrayRemoteDataSource: Fetching X-rays');
    print('XrayRemoteDataSource: URL: ${ApiConstants.baseUrl}/patients/me/xrays');
    
    final response = await dio.get(
      '${ApiConstants.baseUrl}/patients/me/xrays',
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
    
    print('XrayRemoteDataSource: Response status: ${response.statusCode}');
    print('XrayRemoteDataSource: Response data: ${response.data}');
    
    final data = response.data as List;
    print('XrayRemoteDataSource: Data length: ${data.length}');
    
    final xrays = data.map((json) => XrayModel.fromJson(json)).toList();
    print('XrayRemoteDataSource: X-rays count: ${xrays.length}');
    
    return xrays;
  }
}
