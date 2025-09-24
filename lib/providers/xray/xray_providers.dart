import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../core/dio_provider.dart';
import '../../domain/entities/xray.dart';
import '../../data/datasources/xray_remote_data_source.dart';
import '../../data/repositories_impl/xray_repository_impl.dart';
import '../../data/usecases/get_xrays_usecase_impl.dart';
import '../../presentation/viewmodels/xray/xray_viewmodel.dart';

// Data Source Provider
final xrayDataSourceProvider = Provider<XrayRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return XrayRemoteDataSource(dio: dio);
});

// Repository Provider
final xrayRepositoryProvider = Provider<XrayRepositoryImpl>((ref) {
  final dataSource = ref.watch(xrayDataSourceProvider);
  return XrayRepositoryImpl(remoteDataSource: dataSource);
});

// Use Case Provider
final xrayUseCaseProvider = Provider<GetXraysUseCaseImpl>((ref) {
  final repository = ref.watch(xrayRepositoryProvider);
  return GetXraysUseCaseImpl(repository: repository);
});

// ViewModel Provider
final xrayViewModelProvider = StateNotifierProvider<XrayViewModel, AsyncValue<List<Xray>>>((ref) {
  final useCase = ref.watch(xrayUseCaseProvider);
  return XrayViewModel(useCase);
});
