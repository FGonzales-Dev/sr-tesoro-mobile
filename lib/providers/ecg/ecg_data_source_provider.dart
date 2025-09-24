import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/ecg_remote_data_source.dart';
import '../core/dio_provider.dart';

final ecgRemoteDataSourceProvider = Provider<EcgRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return EcgRemoteDataSource(dio);
});
