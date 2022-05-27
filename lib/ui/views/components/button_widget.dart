import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_text_style.dart';

class ButtonWidget extends StatelessWidget {
  final Color colorButton;
  final String textButton;
  final VoidCallback onPressed;

  const ButtonWidget(
      {Key? key,
      required this.colorButton,
      required this.textButton,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: LasTextStyle.txtButton,
          // primary: colorButton,
          padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.2),
          )),
      onPressed: onPressed,
      child: Text(textButton),
    );
  }
}
