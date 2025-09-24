import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../core/dio_provider.dart';
import '../../domain/entities/patient.dart';
import '../../domain/usecases/get_patient_profile_usecase.dart';
import '../../data/datasources/patient_remote_data_source.dart';
import '../../data/usecases/get_patient_profile_usecase_impl.dart';
import '../../presentation/viewmodels/patient/patient_viewmodel.dart';

// Data Source Provider
final patientDataSourceProvider = Provider<PatientRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return PatientRemoteDataSource(dio: dio);
});

// Use Case Provider
final getPatientProfileUseCaseProvider = Provider<GetPatientProfileUseCase>((ref) {
  final remoteDataSource = ref.watch(patientDataSourceProvider);
  return GetPatientProfileUseCaseImpl(remoteDataSource: remoteDataSource);
});

// ViewModel Provider
final patientViewModelProvider = StateNotifierProvider<PatientViewModel, AsyncValue<Patient?>>((ref) {
  final getPatientProfileUseCase = ref.watch(getPatientProfileUseCaseProvider);
  return PatientViewModel(getPatientProfileUseCase);
});
