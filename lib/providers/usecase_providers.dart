import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/get_consultations_usecase.dart';
import '../domain/usecases/get_ecg_records_usecase.dart';
import '../domain/usecases/get_lab_tests_usecase.dart';
import 'repository_providers.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return ref.watch(authRepositoryProvider);
});

final getConsultationsUseCaseProvider = Provider<GetConsultationsUseCase>((ref) {
  return ref.watch(consultationRepositoryProvider);
});

final getEcgRecordsUseCaseProvider = Provider<GetEcgRecordsUseCase>((ref) {
  return ref.watch(ecgRepositoryProvider);
});

final getLabTestsUseCaseProvider = Provider<GetLabTestsUseCase>((ref) {
  return ref.watch(labTestRepositoryProvider);
});
