import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

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
  Widget build(BuildContext context) {
    return TextFormField(
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
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          }
          return null;
        });
  }
}
