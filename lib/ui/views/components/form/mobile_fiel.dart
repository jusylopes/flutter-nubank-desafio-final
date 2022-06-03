import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask/mask/mask.dart';
import 'package:mask/models/hashtag_is.dart';

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
        Mask.generic(
          masks: ['(##) #####-####'],
          hashtag: Hashtag.numbers, // optional field
        ),
      ],
      decoration: const InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        labelText: 'Celular',
      ),
    );
  }
}
