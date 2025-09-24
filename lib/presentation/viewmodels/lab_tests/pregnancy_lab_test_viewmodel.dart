import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/pregnancy_lab_test.dart';
import '../../../domain/usecases/get_lab_tests_usecase.dart';

class PregnancyLabTestViewModel extends StateNotifier<AsyncValue<List<PregnancyLabTest>>> {
  final GetLabTestsUseCase useCase;
  PregnancyLabTestViewModel(this.useCase) : super(const AsyncValue.data([]));

  Future<void> fetchPregnancyLabTests(String accessToken) async {
    if (!state.hasValue) {
      state = const AsyncValue.loading();
    }
    try {
      final tests = await useCase.getLabTests(accessToken, 'pregnancy-test');
      state = AsyncValue.data(tests.cast<PregnancyLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshPregnancyLabTests(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final tests = await useCase.getLabTests(accessToken, 'pregnancy-test');
      state = AsyncValue.data(tests.cast<PregnancyLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
