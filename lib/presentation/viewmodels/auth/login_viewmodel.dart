import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login_usecase.dart';

class LoginViewModel extends StateNotifier<AsyncValue<User?>> {
  final LoginUseCase loginUseCase;
  String? _accessToken;
  String? get accessToken => _accessToken;

  LoginViewModel(this.loginUseCase) : super(const AsyncValue.data(null));

  Future<void> login(String patientAccountId, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await loginUseCase.login(patientAccountId, password);
      _accessToken = user.accessToken;
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
