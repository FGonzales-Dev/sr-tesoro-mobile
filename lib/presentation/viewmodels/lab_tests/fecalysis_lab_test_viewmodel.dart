import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/fecalysis_lab_test.dart';
import '../../../domain/usecases/get_lab_tests_usecase.dart';

class FecalysisLabTestViewModel extends StateNotifier<AsyncValue<List<FecalysisLabTest>>> {
  final GetLabTestsUseCase useCase;
  FecalysisLabTestViewModel(this.useCase) : super(const AsyncValue.data([]));

  Future<void> fetchFecalysisLabTests(String accessToken) async {
    if (!state.hasValue) {
      state = const AsyncValue.loading();
    }
    try {
      final tests = await useCase.getLabTests(accessToken, 'fecalysis');
      state = AsyncValue.data(tests.cast<FecalysisLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshFecalysisLabTests(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final tests = await useCase.getLabTests(accessToken, 'fecalysis');
      state = AsyncValue.data(tests.cast<FecalysisLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
