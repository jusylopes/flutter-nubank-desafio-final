import 'package:mask/mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
        initialDate: DateTime(2004),
        initialDatePickerMode: DatePickerMode.year,
        firstDate: DateTime(1922),
        lastDate: DateTime(2004));
    if (dateNew != null) {
      dateTime = dateNew;

      widget.dateController.text =
          DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, 'pt-BR').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dateController,
      keyboardType: TextInputType.datetime,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        Mask.date(),
      ],
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.calendar_month),
        border: OutlineInputBorder(borderRadius: BorderRadius.zero),
        labelText: 'Data de Nascimento',
      ),
      readOnly: true,
      onTap: _selectDate,
    );
  }
}
