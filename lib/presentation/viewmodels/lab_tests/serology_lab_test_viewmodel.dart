import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/serology_lab_test.dart';
import '../../../domain/usecases/get_lab_tests_usecase.dart';

class SerologyLabTestViewModel extends StateNotifier<AsyncValue<List<SerologyLabTest>>> {
  final GetLabTestsUseCase useCase;
  SerologyLabTestViewModel(this.useCase) : super(const AsyncValue.data([]));

  Future<void> fetchSerologyLabTests(String accessToken) async {
    if (!state.hasValue) {
      state = const AsyncValue.loading();
    }
    try {
      final tests = await useCase.getLabTests(accessToken, 'serology');
      state = AsyncValue.data(tests.cast<SerologyLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshSerologyLabTests(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final tests = await useCase.getLabTests(accessToken, 'serology');
      state = AsyncValue.data(tests.cast<SerologyLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
