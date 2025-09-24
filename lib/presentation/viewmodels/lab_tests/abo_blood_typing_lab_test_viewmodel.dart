import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/abo_blood_typing_lab_test.dart';
import '../../../domain/usecases/get_lab_tests_usecase.dart';

class AboBloodTypingLabTestViewModel extends StateNotifier<AsyncValue<List<AboBloodTypingLabTest>>> {
  final GetLabTestsUseCase useCase;
  AboBloodTypingLabTestViewModel(this.useCase) : super(const AsyncValue.data([]));

  Future<void> fetchAboBloodTypingLabTests(String accessToken) async {
    if (!state.hasValue) {
      state = const AsyncValue.loading();
    }
    try {
      final tests = await useCase.getLabTests(accessToken, 'abo-blood-typing');
      state = AsyncValue.data(tests.cast<AboBloodTypingLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshAboBloodTypingLabTests(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final tests = await useCase.getLabTests(accessToken, 'abo-blood-typing');
      state = AsyncValue.data(tests.cast<AboBloodTypingLabTest>());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
