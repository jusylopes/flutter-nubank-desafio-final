import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController nameController;
  final String? initialValue;

  const NameField({super.key, required this.nameController, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: nameController,
        autofocus: false,
        initialValue: initialValue,
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
          labelText: 'Nome Completo',
          filled: true,
        ),
        validator: (String? value) {
          return value == null || value.isEmpty ? 'Campo obrigatório' : null;
        });
  }
}
