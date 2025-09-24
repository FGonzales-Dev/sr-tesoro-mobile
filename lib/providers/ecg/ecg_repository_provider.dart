import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories_impl/ecg_repository_impl.dart';
import 'ecg_data_source_provider.dart';

final ecgRepositoryProvider = Provider<EcgRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(ecgRemoteDataSourceProvider);
  return EcgRepositoryImpl(remoteDataSource);
});
