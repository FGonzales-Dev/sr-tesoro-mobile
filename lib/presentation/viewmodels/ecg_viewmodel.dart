import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/ecg_record.dart';
import '../../domain/usecases/get_ecg_records_usecase.dart';

class EcgViewModel extends StateNotifier<AsyncValue<List<EcgRecord>>> {
  final GetEcgRecordsUseCase useCase;
  EcgViewModel(this.useCase) : super(const AsyncValue.loading());

  Future<void> fetchEcgRecords(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final records = await useCase.getEcgRecords(accessToken);
      state = AsyncValue.data(records);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
