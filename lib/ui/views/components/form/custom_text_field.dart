import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String label;
  final void Function(String)? onChanged;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.keyboardType,
      required this.label,
      this.inputFormatters,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
        labelText: label,
      ),
      onChanged: onChanged,
    );
  }
}
