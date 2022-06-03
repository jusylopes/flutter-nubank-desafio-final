import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;

  const PhoneField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      // inputFormatters: [
      //   FilteringTextInputFormatter.digitsOnly,
      //   TelefoneInputFormatter(),
      // ],
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        labelText: 'Telefone',
      ),
    );
  }
}
