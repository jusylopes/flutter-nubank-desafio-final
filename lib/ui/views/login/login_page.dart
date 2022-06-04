import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/login_entity.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/components/alert_dialog.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:projeto_final/ui/views/components/background_curve.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';
import 'package:projeto_final/ui/views/components/form/cpf_field.dart';
import 'package:projeto_final/ui/views/components/form/password_field.dart';

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

  void submit() async {
    setState(() {
      _colorButton = LasColors.buttonColorAwait;
      _textButton = Strings.buttonAwait;
    });

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (_formKey.currentState!.validate()) {
      bool validateSucess = await userRepository.login(
        LoginEntity(
          cpf: _cpfController.text.replaceAll(".", "").replaceAll("-", ""),
          password: _passwordController.text,
        ),
      );
      //Fim do teste
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      if (validateSucess) {
        //para retirar erro de gap
        if (!mounted) return;
        Navigator.of(context).popAndPushNamed(Routes.home);
      } else {
        _cpfController.clear();
        _passwordController.clear();
        setState(() {
          _colorButton = LasColors.buttonColor;
          _textButton = Strings.buttonRegister;
        });
        showAlert();
      }
    } else {
      debugPrint('Errooooooooo');
    }
  }

  void showAlert() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const Alert(
            bodyAlert: Strings.loginAlertDialog, txtButton: Strings.buttonOk));
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
                          onPressed: submit,
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

  //Usar o showAlert
  final snackBar = const SnackBar(
    content: Text('CPF ou Senha inválidos'),
    backgroundColor: Colors.redAccent,
  );
}
