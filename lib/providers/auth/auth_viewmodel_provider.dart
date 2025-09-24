import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../presentation/viewmodels/auth/login_viewmodel.dart';
import 'auth_usecase_provider.dart';

final loginViewModelProvider = StateNotifierProvider<LoginViewModel, AsyncValue<User?>>((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  return LoginViewModel(loginUseCase);
});
