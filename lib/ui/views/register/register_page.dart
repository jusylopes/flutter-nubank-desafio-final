import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/user/post/login_entity.dart';
import 'package:projeto_final/data/entity/user/post/register_entity.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/components/alert_dialog.dart';
import 'package:projeto_final/ui/views/components/background_curve.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';
import 'package:projeto_final/ui/views/components/form/cpf_field.dart';
import 'package:projeto_final/ui/views/components/form/email_field.dart';
import 'package:projeto_final/ui/views/components/logo_app.dart';
import 'package:projeto_final/ui/views/components/form/name_field.dart';
import 'package:projeto_final/ui/views/components/form/password_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();
  final userRepository = SwaggerApiUserRepository();
  Color _colorButton = LasColors.buttonColor;
  String _textButton = Strings.buttonRegister;

  void validateSuccess() async {
    setState(() {
      _colorButton = LasColors.buttonColorAwait;
      _textButton = Strings.buttonAwait;
    });

    if (_formKey.currentState!.validate()) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      bool validateSucess = await userRepository.register(
        RegisterEntity(
            fullName: _nameController.text,
            email: _emailController.text,
            cpf: _cpfController.text.replaceAll(".", "").replaceAll("-", ""),
            password: _passwordController.text),
      );
      await userRepository.login(LoginEntity(
          cpf: _cpfController.text.replaceAll(".", "").replaceAll("-", ""),
          password: _passwordController.text));
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      if (validateSucess) {
        //para retirar erro de gap
        if (!mounted) return;
        Navigator.of(context).popAndPushNamed(Routes.home);
      } else {
        setState(() {
          _colorButton = LasColors.buttonColor;
          _textButton = Strings.buttonRegister;
        });
        _nameController.clear();
        _cpfController.clear();
        _emailController.clear();
        _passwordController.clear();
      }
    } else {
      debugPrint('errooo');
    }
  }

  //chamar no caso de cpf já cadastrado
  void showAlert() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const Alert(
            bodyAlert: Strings.txtRegisterAlertWidget,
            txtButton: Strings.buttonOk));
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
                  const LogoApp(heightContainer: 250),
                  Container(
                    alignment: Alignment.topCenter,
                    child: const Text(
                      Strings.txtTitleRegister,
                      style: LasTextStyle.titlePageRegister,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 22),
                    child: const Text(
                      Strings.txtSubtitleRegister,
                      style: LasTextStyle.registerSubtitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: <Widget>[
                          NameField(nameController: _nameController),
                          const SizedBox(height: 15.0),
                          EmailField(emailController: _emailController),
                          const SizedBox(height: 15.0),
                          CpfField(cpfController: _cpfController),
                          const SizedBox(height: 15.0),
                          PasswordField(
                              passwordController: _passwordController),
                          const SizedBox(height: 25.0),
                          ButtonWidget(
                            colorButton: _colorButton,
                            textButton: _textButton,
                            onPressed: validateSuccess,
                          ),
                        ],
                      ),
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

const snackBar = SnackBar(
  content: Text('CPF ou Senha inválidos'),
  backgroundColor: Colors.redAccent,
);
