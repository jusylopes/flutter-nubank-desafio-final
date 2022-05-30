import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController nameController;

  const NameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: nameController,
         autofocus: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
          labelText: 'Name',
        ),
        validator: (String? value) {
          return value == null || value.isEmpty ? 'Campo obrigatório' : null;
        });
  }
}
