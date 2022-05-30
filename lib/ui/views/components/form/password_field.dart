import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordField({super.key, required this.passwordController});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isHidden = true;

  _passwordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void dispose() {
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.passwordController,
        obscureText: _isHidden,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
          labelText: 'Senha',
          suffixIcon: IconButton(
            icon: _isHidden
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: _passwordView,
          ),
        ),
        validator: (String? value) {
          return value == null || value.isEmpty ? 'Campo obrigatório' : null;
        });
  }
}
