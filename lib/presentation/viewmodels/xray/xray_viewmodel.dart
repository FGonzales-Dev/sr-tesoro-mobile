import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/xray.dart';
import '../../../domain/usecases/get_xrays_usecase.dart';

class XrayViewModel extends StateNotifier<AsyncValue<List<Xray>>> {
  final GetXraysUseCase useCase;
  XrayViewModel(this.useCase) : super(const AsyncValue.data([]));

  Future<void> fetchXrays(String accessToken) async {
    print('XrayViewModel: fetchXrays called');
    state = const AsyncValue.loading();
    try {
      final xrays = await useCase.getXrays(accessToken);
      print('XrayViewModel: Received ${xrays.length} X-rays');
      state = AsyncValue.data(xrays);
    } catch (e, st) {
      print('XrayViewModel: Error fetching X-rays: $e');
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshXrays(String accessToken) async {
    // Always show loading when explicitly refreshing
    state = const AsyncValue.loading();
    try {
      final xrays = await useCase.getXrays(accessToken);
      state = AsyncValue.data(xrays);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
