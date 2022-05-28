import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/login_entity.dart';
import 'package:projeto_final/external/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/background_curve.dart';
import 'package:projeto_final/ui/views/components/background_page.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';
import 'package:projeto_final/ui/views/components/cpf_field.dart';
import 'package:projeto_final/ui/views/components/password_field.dart';
import 'package:projeto_final/ui/views/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  Color _colorButton = LasColors.buttonColor;
  String _textButton = Strings.buttonLogin;
  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();
  final userRepository = SwaggerApiUserRepository();

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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: CpfField(
                            cpfController: _cpfController,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: PasswordField(
                                passwordController: _passwordController)),
                        const SizedBox(height: 25.0),
                        ButtonWidget(
                          colorButton: _colorButton,
                          textButton: _textButton,
                          //Isa Removeu
                          // onPressed: () {
                          //   if (_formKey.currentState!.validate()) {
                          //     setState(() {
                          //       _colorButton = LasColors.buttonColorAwait;
                          //       _textButton = Strings.buttonAwait;
                          //     });
                          //   }
                          // },

                          //Isa adicionou
                          onPressed: () async {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (_formKey.currentState!.validate()) {
                              // bool deuCerto = await login();
                              //Teste
                              bool deuCerto = await userRepository.login(
                                LoginEntity(
                                  cpf: _cpfController.text
                                      .replaceAll(".", "")
                                      .replaceAll("-", ""),
                                  password: _passwordController.text,
                                ),
                              );
                              //Fim do teste
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              if (deuCerto) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              } else {
                                _cpfController.clear();
                                _passwordController.clear();
                                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            } else {
                              print('Deu merda');
                            }
                          },
                        ),
                      ],
                    ),
                  )
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
