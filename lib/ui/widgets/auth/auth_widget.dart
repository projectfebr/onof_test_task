import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onof_test_task/ui/widgets/auth/auth_model.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authModel = context.watch<AuthModel>();
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Connect to ONLYOFFICE',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 300),
              child: Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        enabled: authModel.canStartAuth,
                        textInputAction: TextInputAction.next,
                        controller: authModel.portalTextController,
                        decoration: const InputDecoration(
                          labelText: 'Portal',
                          hintText: 'Enter portal',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter portal';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        enabled: authModel.canStartAuth,
                        textInputAction: TextInputAction.next,
                        controller: authModel.loginTextController,
                        decoration: const InputDecoration(
                          labelText: 'Login',
                          hintText: 'Enter portal',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter login';
                          }

                          return null;
                        },
                      ),
                      _PasswordTextField(authModel: authModel),
                      const SizedBox(height: 40),
                      const _ErrorMessageWidget(),
                      const _AuthButtonWidget(),
                    ]),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

// StateFullWidget для пароля чтобы управлять состоянием видимости
class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    Key? key,
    required this.authModel,
  }) : super(key: key);

  final AuthModel authModel;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.authModel.canStartAuth,
      textInputAction: TextInputAction.done,
      obscureText: !_passwordVisible,
      controller: widget.authModel.passTextController,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter password',
        suffixIcon: IconButton(
          onPressed: () {
            _passwordVisible = !_passwordVisible;
            setState(() {});
          },
          icon: _passwordVisible
              ? const Icon(Icons.visibility_off, size: 20)
              : const Icon(Icons.visibility, size: 20),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authModel = context.watch<AuthModel>();
    final onPressed = authModel.canStartAuth == true
        ? () {
            final formState = context.findAncestorStateOfType<FormState>();
            if (formState != null && formState.validate()) {
              authModel.auth(context);
            }
          }
        : null;
    final child = authModel.isAuthProgress == true
        ? const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ))
        : const Text('Login');
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.watch<AuthModel>().errorMesage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.red, fontSize: 17),
      ),
    );
  }
}
