import '../../domain/entities/xray.dart';
import '../../domain/usecases/get_xrays_usecase.dart';
import '../../data/repositories_impl/xray_repository_impl.dart';

class GetXraysUseCaseImpl implements GetXraysUseCase {
  final XrayRepositoryImpl repository;

  GetXraysUseCaseImpl({required this.repository});

  @override
  Future<List<Xray>> getXrays(String accessToken) async {
    return await repository.getXrays(accessToken);
  }
}
