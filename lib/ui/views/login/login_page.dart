import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:projeto_final/ui/views/components/background_page.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  Container(
                    height: 340,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.contain,
                            alignment: Alignment.bottomCenter)),
                  ),
                  Container(
                    height: 150,
                    width: 350,
                    alignment: Alignment.topCenter,
                    child: Text(
                      Strings.appName,
                      style: LasTextStyle.titlePage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    child: ButtonWidget(colorButton: LasColors.buttonColor, textButton: Strings.buttonInitial, onPressed: (){})
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                        text: Strings.txtPageLogin,
                        style: LasTextStyle.loginPage,
                        children: <TextSpan>[
                          TextSpan(
                              text: Strings.txtPageLoginCreate,
                              style: LasTextStyle.loginPageCreate,
                              recognizer: TapGestureRecognizer()..onTap = () {})
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
