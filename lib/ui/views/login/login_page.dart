import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/background_curve.dart';
import 'package:projeto_final/ui/views/components/background_page.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final maskFormatterCpf = MaskTextInputFormatter(mask: '###.###.###-##');
  bool _isHidden = true;

  _passwordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

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
                      Strings.txtTitletxtTitleLogin,
                      style: LasTextStyle.titleLoginPage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 20),
                    child: const Text(
                      Strings.txtSubtitleLogin,
                      style: LasTextStyle.loginSubtitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [maskFormatterCpf],
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
                        child: TextFormField(
                            obscureText: _isHidden,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.zero),
                              labelText: 'Senha',
                              suffixIcon: IconButton(
                                icon: _isHidden
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: _passwordView,
                              ),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            }),
                      ),
                      const SizedBox(height: 25.0),
                      ButtonWidget(
                        colorButton: LasColors.buttonColor,
                        textButton: Strings.buttonLogin,
                        onPressed: () {},
                      ),
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

showAlertWidget(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    animType: AnimType.BOTTOMSLIDE,
    width: MediaQuery.of(context).size.width * 1,
    padding: const EdgeInsets.only(top: 50, bottom: 50, right: 20, left: 20),
    title: Strings.txtAuthenticationAlertDialog,
    titleTextStyle: LasTextStyle.txtalertWidget,
    btnOkText: Strings.buttonOk,
    btnOkColor: LasColors.buttonColor,
    buttonsBorderRadius: BorderRadius.circular(4.0),
    buttonsTextStyle: LasTextStyle.alertWidgetButton,
    dismissOnTouchOutside: false,
    btnOkOnPress: () {},
  ).show();
}
