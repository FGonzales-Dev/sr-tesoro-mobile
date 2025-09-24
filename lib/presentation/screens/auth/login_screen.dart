import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/login_form.dart';
import '../../../providers/providers.dart';

class LoginScreen extends ConsumerWidget {
  final VoidCallback? onLoginSuccess;
  const LoginScreen({Key? key, this.onLoginSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LoginForm(onLoginSuccess: onLoginSuccess),
        ),
      ),
    );
  }
}
