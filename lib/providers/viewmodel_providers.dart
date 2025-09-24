import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../presentation/viewmodels/auth/login_viewmodel.dart';
import '../presentation/viewmodels/consultation/consultation_viewmodel.dart';
import '../presentation/viewmodels/ecg/ecg_viewmodel.dart';
import '../presentation/viewmodels/lab_tests/lab_test_viewmodel.dart';
import 'usecase_providers.dart';

final loginViewModelProvider = StateNotifierProvider<LoginViewModel, AsyncValue<dynamic>>((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  return LoginViewModel(loginUseCase);
});

final consultationViewModelProvider = StateNotifierProvider<ConsultationViewModel, AsyncValue<List<dynamic>>>((ref) {
  final getConsultationsUseCase = ref.watch(getConsultationsUseCaseProvider);
  return ConsultationViewModel(getConsultationsUseCase);
});

final ecgViewModelProvider = StateNotifierProvider<EcgViewModel, AsyncValue<List<dynamic>>>((ref) {
  final getEcgRecordsUseCase = ref.watch(getEcgRecordsUseCaseProvider);
  return EcgViewModel(getEcgRecordsUseCase);
});

final labTestViewModelProvider = StateNotifierProvider<LabTestViewModel, AsyncValue<List<dynamic>>>((ref) {
  final getLabTestsUseCase = ref.watch(getLabTestsUseCaseProvider);
  return LabTestViewModel(getLabTestsUseCase);
});