import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 350,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomCenter)),
          ),
          Container(
            height: 150,
            width: 350,
            alignment: Alignment.center,
            child: Text(
              Strings.appName,
              style: LasTextStyle.titlePage,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: 50,
            width: 260,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: LasTextStyle.txtButton,
                  primary: LasColors.buttonColor),
              onPressed: () {},
              child: Text(Strings.buttonLogin.toUpperCase()),
            ),
          ),
          Container(
            height: 30,
            alignment: Alignment.bottomCenter,
            child: const Text(
              Strings.txtPageLogin,
            ),
          )
        ],
      ),
    )));
  }
}
