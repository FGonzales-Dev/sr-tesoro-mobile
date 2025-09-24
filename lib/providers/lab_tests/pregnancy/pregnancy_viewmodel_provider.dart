import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../presentation/viewmodels/lab_tests/pregnancy_lab_test_viewmodel.dart';
import '../lab_test_usecase_provider.dart';

final pregnancyLabTestViewModelProvider = StateNotifierProvider<PregnancyLabTestViewModel, AsyncValue<List<dynamic>>>((ref) {
  final getLabTestsUseCase = ref.watch(getLabTestsUseCaseProvider);
  return PregnancyLabTestViewModel(getLabTestsUseCase);
});
