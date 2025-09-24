import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/lab_test.dart';
import '../../../domain/usecases/get_lab_tests_usecase.dart';

class LabTestViewModel extends StateNotifier<AsyncValue<List<LabTest>>> {
  final GetLabTestsUseCase useCase;
  LabTestViewModel(this.useCase) : super(const AsyncValue.data([]));

  Future<void> fetchLabTests(String accessToken, String type) async {
    state = const AsyncValue.loading();
    try {
      final tests = await useCase.getLabTests(accessToken, type);
      state = AsyncValue.data(tests);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshLabTests(String accessToken, String type) async {
    // Always show loading when explicitly refreshing
    state = const AsyncValue.loading();
    try {
      final tests = await useCase.getLabTests(accessToken, type);
      state = AsyncValue.data(tests);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
