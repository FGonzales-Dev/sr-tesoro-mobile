import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/cbc_lab_test.dart';
import '../../../domain/usecases/get_lab_tests_usecase.dart';

class CbcLabTestViewModel extends StateNotifier<AsyncValue<List<CbcLabTest>>> {
  final GetLabTestsUseCase useCase;
  CbcLabTestViewModel(this.useCase) : super(const AsyncValue.data([]));

  Future<void> fetchCbcLabTests(String accessToken) async {
    // Only set loading if we don't already have data
    if (!state.hasValue) {
      state = const AsyncValue.loading();
    }
    try {
      final tests = await useCase.getLabTests(accessToken, 'cbc');
      state = AsyncValue.data(tests.cast<CbcLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshCbcLabTests(String accessToken) async {
    // Always show loading when explicitly refreshing
    state = const AsyncValue.loading();
    try {
      final tests = await useCase.getLabTests(accessToken, 'cbc');
      state = AsyncValue.data(tests.cast<CbcLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
