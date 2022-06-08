import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        labelText: 'Email',
      ),
      validator: (String? value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'E-mail invalido';
        }
        return null;
      },
    );
  }
}
