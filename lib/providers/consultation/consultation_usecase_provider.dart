import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_consultations_usecase.dart';
import 'consultation_repository_provider.dart';

final getConsultationsUseCaseProvider = Provider<GetConsultationsUseCase>((ref) {
  return ref.watch(consultationRepositoryProvider);
});
