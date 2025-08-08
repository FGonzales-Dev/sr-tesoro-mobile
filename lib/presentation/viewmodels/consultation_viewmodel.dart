import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/consultation.dart';
import '../../domain/usecases/get_consultations_usecase.dart';

class ConsultationViewModel extends StateNotifier<AsyncValue<List<Consultation>>> {
  final GetConsultationsUseCase useCase;
  ConsultationViewModel(this.useCase) : super(const AsyncValue.loading());

  Future<void> fetchConsultations(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final consultations = await useCase.getConsultations(accessToken);
      state = AsyncValue.data(consultations);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
