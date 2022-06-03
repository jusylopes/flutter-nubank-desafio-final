import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BirthdayDate extends StatefulWidget {
  final TextEditingController dateController;

  const BirthdayDate({super.key, required this.dateController});

  @override
  State<BirthdayDate> createState() => _BirthdayDateState();
}

class _BirthdayDateState extends State<BirthdayDate> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dateController,
      keyboardType: TextInputType.datetime,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DataInputFormatter(),
      ],
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.calendar_month),
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        labelText: 'Data de Nascimento',
       
      ),
      
      onTap: () async {},
    );
  }
}
