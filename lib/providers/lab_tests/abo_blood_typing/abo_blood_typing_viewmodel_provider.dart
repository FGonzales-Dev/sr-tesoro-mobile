import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../presentation/viewmodels/lab_tests/abo_blood_typing_lab_test_viewmodel.dart';
import '../lab_test_usecase_provider.dart';

final aboBloodTypingLabTestViewModelProvider = StateNotifierProvider<AboBloodTypingLabTestViewModel, AsyncValue<List<dynamic>>>((ref) {
  final getLabTestsUseCase = ref.watch(getLabTestsUseCaseProvider);
  return AboBloodTypingLabTestViewModel(getLabTestsUseCase);
});
