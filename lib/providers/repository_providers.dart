import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/datasources/auth_remote_data_source.dart';
import '../data/datasources/consultation_remote_data_source.dart';
import '../data/datasources/ecg_remote_data_source.dart';
import '../data/datasources/lab_test_remote_data_source.dart';
import '../data/repositories_impl/auth_repository_impl.dart';
import '../data/repositories_impl/consultation_repository_impl.dart';
import '../data/repositories_impl/ecg_repository_impl.dart';
import '../data/repositories_impl/lab_test_repository_impl.dart';
import 'package:dio/dio.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSource(dio);
});

final consultationRemoteDataSourceProvider = Provider<ConsultationRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return ConsultationRemoteDataSource(dio);
});

final ecgRemoteDataSourceProvider = Provider<EcgRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return EcgRemoteDataSource(dio);
});

final labTestRemoteDataSourceProvider = Provider<LabTestRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return LabTestRemoteDataSource(dio);
});

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
});

final consultationRepositoryProvider = Provider<ConsultationRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(consultationRemoteDataSourceProvider);
  return ConsultationRepositoryImpl(remoteDataSource);
});

final ecgRepositoryProvider = Provider<EcgRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(ecgRemoteDataSourceProvider);
  return EcgRepositoryImpl(remoteDataSource);
});

final labTestRepositoryProvider = Provider<LabTestRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(labTestRemoteDataSourceProvider);
  return LabTestRepositoryImpl(remoteDataSource);
});
