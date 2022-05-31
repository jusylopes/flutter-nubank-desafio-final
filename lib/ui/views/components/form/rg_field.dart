import 'package:flutter/material.dart';

class RgField extends StatelessWidget {
  final TextEditingController rgController;

  const RgField({super.key, required this.rgController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: rgController,
        keyboardType: TextInputType.number,       
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
          labelText: 'RG',
        ),
        validator: (String? value) {
          return value == null || value.isEmpty ? 'Campo obrigatório' : null;
        });
  }
}
