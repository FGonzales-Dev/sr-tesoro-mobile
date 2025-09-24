import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/consultation_remote_data_source.dart';
import '../core/dio_provider.dart';

final consultationRemoteDataSourceProvider = Provider<ConsultationRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ConsultationRemoteDataSource(dio);
});
