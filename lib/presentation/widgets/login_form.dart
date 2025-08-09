import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/login_viewmodel.dart';
import '../../providers/viewmodel_providers.dart';

class LoginForm extends ConsumerStatefulWidget {
  final VoidCallback? onLoginSuccess;
  const LoginForm({Key? key, this.onLoginSuccess}) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _patientAccountId = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginViewModelProvider);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Patient Account ID'),
            onChanged: (value) => _patientAccountId = value,
            validator: (value) => value == null || value.isEmpty ? 'Enter patient account ID' : null,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            onChanged: (value) => _password = value,
            validator: (value) => value == null || value.isEmpty ? 'Enter password' : null,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: loginState.isLoading
                ? null
                : () async {
                    if (_formKey.currentState!.validate()) {
                      await ref.read(loginViewModelProvider.notifier).login(_patientAccountId, _password);
                      final user = ref.read(loginViewModelProvider);
                      if (user.value != null && widget.onLoginSuccess != null) {
                        widget.onLoginSuccess!();
                      }
                    }
                  },
            child: loginState.isLoading ? const CircularProgressIndicator() : const Text('Login'),
          ),
          if (loginState.hasError)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Login failed', style: TextStyle(color: Colors.red)),
            ),
        ],
      ),
    );
  }
}
