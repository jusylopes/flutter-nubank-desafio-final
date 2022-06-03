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
  DateTime dateTime = DateTime.now();

  _selectDate() async {
    final DateTime? dateNew = await showDatePicker(
        context: context,
        initialDate: dateTime,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (dateNew != null) {
      dateTime = dateNew;
      print(dateNew.format);
      widget.dateController.text = dateTime.format.toString();
      //assign the chosen date to the controller
    }
  }

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
        filled: true,
      ),
      readOnly: true,
      onTap: _selectDate,
    );
  }
}

extension DateTimeExtension on DateTime {
  String get format {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  }
}
 
        // showDatePicker(
        //   context: context,
        //   initialDate: DateTime.now(),
        //   firstDate: DateTime(1900),
        //   lastDate: DateTime(2060),
        // ).then((date) {
        //   setState(() {
        //     _dateTime = date;
        //   });
        // });
