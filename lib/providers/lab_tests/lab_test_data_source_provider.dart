import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/lab_test_remote_data_source.dart';
import '../core/dio_provider.dart';

final labTestRemoteDataSourceProvider = Provider<LabTestRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return LabTestRemoteDataSource(dio);
});
