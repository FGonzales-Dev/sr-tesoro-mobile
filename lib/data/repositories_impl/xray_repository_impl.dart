import '../../domain/entities/xray.dart';
import '../datasources/xray_remote_data_source.dart';

class XrayRepositoryImpl {
  final XrayRemoteDataSource remoteDataSource;

  XrayRepositoryImpl({required this.remoteDataSource});

  Future<List<Xray>> getXrays(String accessToken) async {
    return await remoteDataSource.getXrays(accessToken);
  }
}
