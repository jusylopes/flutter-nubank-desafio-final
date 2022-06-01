import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController nameController;
  final String? textTextField;

  const NameField(
      {super.key, required this.nameController, this.textTextField});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: nameController,
        autofocus: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
          hintText: textTextField,
          labelText: 'Name',
          filled: true,
        ),
        validator: (String? value) {
          return value == null || value.isEmpty ? 'Campo obrigatório' : null;
        });
  }
}
