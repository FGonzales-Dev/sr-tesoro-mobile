import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories_impl/lab_test_repository_impl.dart';
import 'lab_test_data_source_provider.dart';

final labTestRepositoryProvider = Provider<LabTestRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(labTestRemoteDataSourceProvider);
  return LabTestRepositoryImpl(remoteDataSource);
});
