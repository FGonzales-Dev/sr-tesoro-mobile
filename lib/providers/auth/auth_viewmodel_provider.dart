import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/viewmodels/auth/login_viewmodel.dart';
import 'auth_usecase_provider.dart';

final loginViewModelProvider = StateNotifierProvider<LoginViewModel, AsyncValue<dynamic>>((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  return LoginViewModel(loginUseCase);
});
