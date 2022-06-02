import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_text_style.dart';

class TextTileForm extends StatelessWidget {
  final String textTitleForm;

  const TextTileForm({super.key, required this.textTitleForm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( top: 20, bottom: 20),
      child: Text(
        textTitleForm,
        style: LasTextStyle.txtEditDados,
        textAlign: TextAlign.left
      ),
    );
  }
}
