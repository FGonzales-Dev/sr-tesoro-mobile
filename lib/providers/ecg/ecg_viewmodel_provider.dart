import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/viewmodels/ecg/ecg_viewmodel.dart';
import 'ecg_usecase_provider.dart';

final ecgViewModelProvider = StateNotifierProvider<EcgViewModel, AsyncValue<List<dynamic>>>((ref) {
  final getEcgRecordsUseCase = ref.watch(getEcgRecordsUseCaseProvider);
  return EcgViewModel(getEcgRecordsUseCase);
});
