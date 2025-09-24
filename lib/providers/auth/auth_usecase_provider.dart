import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/login_usecase.dart';
import 'auth_repository_provider.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return ref.watch(authRepositoryProvider);
});
