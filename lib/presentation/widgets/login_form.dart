import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

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
    final grey6 = CupertinoColors.systemGrey6.resolveFrom(context);
    final border = Border.all(
      color: CupertinoColors.systemGrey3.resolveFrom(context),
      width: 1,
    );

    return SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40, top: 40),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 24),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: grey6,
                  borderRadius: BorderRadius.circular(16),
                  border: border,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    children: [
                      CupertinoTextFormFieldRow(
                        placeholder: 'Patient account ID',
                        onChanged: (v) => _patientAccountId = v,
                        validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                        style: const TextStyle(fontSize: 16),
                        placeholderStyle: const TextStyle(color: CupertinoColors.inactiveGray),
                        prefix: const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text('Patient ID', style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ),
                      // thin divider like iOS lists
                      Container(height: 0.6, color: CupertinoColors.separator.resolveFrom(context)),
                      CupertinoTextFormFieldRow(
                        placeholder: 'Enter password',
                        obscureText: true,
                        onChanged: (v) => _password = v,
                        validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                      
                        style: const TextStyle(fontSize: 16),
                        placeholderStyle: const TextStyle(color: CupertinoColors.inactiveGray),
                        prefix: const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text('Password', style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            // iOS filled button with your brand color
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: const Color(0xFF153846),
                  borderRadius: BorderRadius.circular(12),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  onPressed: loginState.isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            await ref
                                .read(loginViewModelProvider.notifier)
                                .login(_patientAccountId, _password);
                            final user = ref.read(loginViewModelProvider);
                            if (user.value != null && widget.onLoginSuccess != null) {
                              widget.onLoginSuccess!();
                            }
                          }
                        },
                  child: loginState.isLoading
                      ? const CupertinoActivityIndicator()
                      : const Text('Login', style: TextStyle(color: CupertinoColors.white)),
                ),
              ),
            ),

            if (loginState.hasError)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text('Login failed', style: TextStyle(color: CupertinoColors.systemRed)),
              ),

            const Spacer(),


          ],
        ),
      ),
    );
  }
}
