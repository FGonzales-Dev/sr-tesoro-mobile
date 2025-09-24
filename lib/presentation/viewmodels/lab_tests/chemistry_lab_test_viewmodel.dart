import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/chemistry_lab_test.dart';
import '../../../domain/usecases/get_lab_tests_usecase.dart';

class ChemistryLabTestViewModel extends StateNotifier<AsyncValue<List<ChemistryLabTest>>> {
  final GetLabTestsUseCase useCase;
  ChemistryLabTestViewModel(this.useCase) : super(const AsyncValue.data([]));

  Future<void> fetchChemistryLabTests(String accessToken) async {
    if (!state.hasValue) {
      state = const AsyncValue.loading();
    }
    try {
      final tests = await useCase.getLabTests(accessToken, 'chemistry');
      state = AsyncValue.data(tests.cast<ChemistryLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshChemistryLabTests(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final tests = await useCase.getLabTests(accessToken, 'chemistry');
      state = AsyncValue.data(tests.cast<ChemistryLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
