import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/background_curve.dart';
import 'package:projeto_final/ui/views/components/background_page.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final maskFormatter = MaskTextInputFormatter(mask: '###.###.###-##');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
        const BackgroundCurve(),
        Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 250,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.contain,
                            alignment: Alignment.topCenter)),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: const Text(
                      Strings.txtTitleLoginRegister,
                      style: LasTextStyle.loginRegisterPage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 20),
                    child: const Text(
                      Strings.txtSubtitleLoginRegister,
                      style: LasTextStyle.loginRegisterPageSubtitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [maskFormatter],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero),
                            labelText: 'CPF',
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 5.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.zero),
                              labelText: 'Senha',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.visibility),
                                onPressed: () {},
                              )),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      ButtonWidget(
                          colorButton: LasColors.buttonColor,
                          textButton: Strings.buttonLogin,
                          onPressed: () {})
                    ],
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
