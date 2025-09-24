import '../../domain/entities/xray.dart';

abstract class GetXraysUseCase {
  Future<List<Xray>> getXrays(String accessToken);
}
