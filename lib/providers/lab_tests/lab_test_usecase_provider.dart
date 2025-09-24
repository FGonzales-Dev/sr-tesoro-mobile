import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_lab_tests_usecase.dart';
import 'lab_test_repository_provider.dart';

final getLabTestsUseCaseProvider = Provider<GetLabTestsUseCase>((ref) {
  return ref.watch(labTestRepositoryProvider);
});
