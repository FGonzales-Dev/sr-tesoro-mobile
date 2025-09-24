import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories_impl/consultation_repository_impl.dart';
import 'consultation_data_source_provider.dart';

final consultationRepositoryProvider = Provider<ConsultationRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(consultationRemoteDataSourceProvider);
  return ConsultationRepositoryImpl(remoteDataSource);
});
