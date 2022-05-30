import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_text_style.dart';

class Alert extends StatelessWidget {
  final String bodyAlert;
  final String txtButton;

  const Alert({super.key, required this.bodyAlert, required this.txtButton});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Center(
                  child: Text(
                bodyAlert,
                style: LasTextStyle.txtalertWidget,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        actions: <Widget>[
          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: LasColors.buttonColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              ),
              child: Text(txtButton, style: LasTextStyle.alertWidgetButton),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
