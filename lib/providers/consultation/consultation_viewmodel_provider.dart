import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/viewmodels/consultation/consultation_viewmodel.dart';
import 'consultation_usecase_provider.dart';

final consultationViewModelProvider = StateNotifierProvider<ConsultationViewModel, AsyncValue<List<dynamic>>>((ref) {
  final getConsultationsUseCase = ref.watch(getConsultationsUseCaseProvider);
  return ConsultationViewModel(getConsultationsUseCase);
});
