import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CpfField extends StatefulWidget {
  final TextEditingController cpfController;

  const CpfField({super.key, required this.cpfController});

  @override
  State<CpfField> createState() => _CpfFieldState();
}

class _CpfFieldState extends State<CpfField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.cpfController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          // CpfInputFormatter(),
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
