import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask/mask/mask.dart';
import 'package:mask/models/hashtag_is.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;

  const PhoneField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,

      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        Mask.generic(
          masks: ['(##) ####-####'],
          hashtag: Hashtag.numbers, // optional field
        ),
      ],

      decoration: const InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        labelText: 'Telefone',
      ),
    );
  }
}
