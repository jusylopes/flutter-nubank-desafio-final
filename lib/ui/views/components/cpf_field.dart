import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class CpfField extends StatefulWidget {
  const CpfField({super.key});

  @override
  State<CpfField> createState() => _CpfFieldState();
}

class _CpfFieldState extends State<CpfField> {
  final TextEditingController _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _cpfController,
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
