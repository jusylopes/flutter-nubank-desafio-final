import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileField extends StatelessWidget {
  final TextEditingController mobileController;

  const MobileField({super.key, required this.mobileController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: mobileController,
        keyboardType: TextInputType.number,  
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter(),
        ],     
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.zero),
          labelText: 'Celular',
        ),
        );
  }
}
