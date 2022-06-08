import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask/mask.dart';

class CpfField extends StatelessWidget {
  final TextEditingController cpfController;

  const CpfField({super.key, required this.cpfController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: cpfController,
      autofocus: false,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //validator: (value) => Mask.validations.cpf(value),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        Mask.cpf(),
      ],
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        labelText: 'CPF',
      ),
    );
  }
}
