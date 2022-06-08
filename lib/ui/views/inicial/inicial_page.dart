import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';
import 'package:projeto_final/ui/views/components/logo_app.dart';

class InicialPage extends StatelessWidget {
  const InicialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
        Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  const LogoApp(heightContainer: 340),
                  Container(
                    height: 150,
                    width: 350,
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      Strings.appName,
                      style: LasTextStyle.titleInicialPage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 65),
                  SizedBox(
                      child: ButtonWidget(
                          colorButton: LasColors.buttonColor,
                          textButton: Strings.buttonInitial,
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.login);
                          })),
                  const SizedBox(height: 15),
                  Container(
                    height: 30,
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                        text: Strings.txtPageInitial,
                        style: LasTextStyle.inicialPage,
                        children: <TextSpan>[
                          TextSpan(
                              text: Strings.txtPageLoginCreate,
                              style: LasTextStyle.loginCreate,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, Routes.register);
                                })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
