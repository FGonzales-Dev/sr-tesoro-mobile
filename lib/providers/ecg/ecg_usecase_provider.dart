import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_ecg_records_usecase.dart';
import 'ecg_repository_provider.dart';

final getEcgRecordsUseCaseProvider = Provider<GetEcgRecordsUseCase>((ref) {
  return ref.watch(ecgRepositoryProvider);
});
