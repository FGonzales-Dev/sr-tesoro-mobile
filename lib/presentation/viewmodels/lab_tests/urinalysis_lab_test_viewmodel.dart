import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/urinalysis_lab_test.dart';
import '../../../domain/usecases/get_lab_tests_usecase.dart';

class UrinalysisLabTestViewModel extends StateNotifier<AsyncValue<List<UrinalysisLabTest>>> {
  final GetLabTestsUseCase useCase;
  UrinalysisLabTestViewModel(this.useCase) : super(const AsyncValue.data([]));

  Future<void> fetchUrinalysisLabTests(String accessToken) async {
    if (!state.hasValue) {
      state = const AsyncValue.loading();
    }
    try {
      final tests = await useCase.getLabTests(accessToken, 'urinalysis');
      state = AsyncValue.data(tests.cast<UrinalysisLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshUrinalysisLabTests(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final tests = await useCase.getLabTests(accessToken, 'urinalysis');
      state = AsyncValue.data(tests.cast<UrinalysisLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
