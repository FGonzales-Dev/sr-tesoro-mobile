import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/ogtt_lab_test.dart';
import '../../../domain/usecases/get_lab_tests_usecase.dart';

class OgttLabTestViewModel extends StateNotifier<AsyncValue<List<OgttLabTest>>> {
  final GetLabTestsUseCase useCase;
  OgttLabTestViewModel(this.useCase) : super(const AsyncValue.data([]));

  Future<void> fetchOgttLabTests(String accessToken) async {
    if (!state.hasValue) {
      state = const AsyncValue.loading();
    }
    try {
      final tests = await useCase.getLabTests(accessToken, 'ogtt');
      state = AsyncValue.data(tests.cast<OgttLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshOgttLabTests(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final tests = await useCase.getLabTests(accessToken, 'ogtt');
      state = AsyncValue.data(tests.cast<OgttLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
