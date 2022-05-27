import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isHidden = true;

  _passwordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
        obscureText: _isHidden,
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
