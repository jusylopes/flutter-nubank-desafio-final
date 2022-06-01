import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CpfField extends StatelessWidget {
  final TextEditingController cpfController;

  const CpfField({super.key, required this.cpfController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: cpfController,
        autofocus: false,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CpfInputFormatter(),
        ],
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
          labelText: 'CPF',
        ),
        validator: (String? value) {
          return value == null || value.isEmpty ? 'Campo obrigatório' : null;
        });
  }
}
