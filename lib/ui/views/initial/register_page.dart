import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/login_entity.dart';
import 'package:projeto_final/data/entity/user_entity.dart';
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

class RegistPage extends StatefulWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final _formKey = GlobalKey<FormState>();
  Color _colorButton = LasColors.buttonColor;
  String _textButton = Strings.buttonLogin;
  final userRepository = SwaggerApiUserRepository();
  final _fullName = TextEditingController();
  final _cpf = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _rg = TextEditingController();
  final _profilePictureUrl = TextEditingController();
  final _birthDate = TextEditingController();

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
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Nome Completo',
                          ),
                          controller: _fullName,
                          keyboardType: TextInputType.text,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Por favor, digite seu nome completo';
                            } else if (name.length < 7) {
                              return 'Por favor, digite um nome maior que 7 caracteres';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'RG',
                          ),
                          controller: _rg,
                          keyboardType: TextInputType.text,
                          validator: (rg) {
                            if (rg == null || rg.isEmpty) {
                              return 'Por favor, digite seu RG';
                            } else if (rg.length < 7) {
                              return 'Por favor, digite um nome maior que 7 caracteres';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'CPF',
                          ),
                          obscureText: true,
                          controller: _cpf,
                          keyboardType: TextInputType.number,
                          validator: (cpf) {
                            if (cpf == null || cpf.isEmpty) {
                              return 'Por favor, digite seu CPF';
                            } else if (cpf.length < 11) {
                              return 'Por favor, digite um CPF com 11 caracteres';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'email',
                          ),
                          obscureText: true,
                          controller: _email,
                          keyboardType: TextInputType.text,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Por favor, digite seu email';
                            } else if (email.length > 255) {
                              return 'Por favor, digite um email com até 255 caracteres';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                          ),
                          obscureText: true,
                          controller: _password,
                          keyboardType: TextInputType.text,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Por favor, digite sua senha';
                            } else if (password.length < 7) {
                              return 'Por favor, digite uma senha maior que 7 caracteres';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Foto',
                          ),
                          obscureText: true,
                          controller: _profilePictureUrl,
                          keyboardType: TextInputType.text,
                          validator: (picture) {
                            if (picture == null || picture.isEmpty) {
                              return 'Por favor, digite sua foto';
                            } else if (picture.length < 7) {
                              return 'Por favor, digite uma senha maior que 7 caracteres';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Data de Nascimento',
                          ),
                          obscureText: true,
                          controller: _birthDate,
                          keyboardType: TextInputType.text,
                          validator: (birthDate) {
                            if (birthDate == null || birthDate.isEmpty) {
                              return 'Por favor, digite sua senha';
                            } else if (birthDate.length < 7) {
                              return 'Por favor, digite uma senha maior que 7 caracteres';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          width: 16,
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (_formKey.currentState!.validate()) {
                              // bool deuCerto = await login();
                              //Teste
                              bool deuCerto = await userRepository.register(
                                UserEntity(
                                  fullName: _fullName.text,
                                  rg: _rg.text,
                                  cpf: _cpf.text,
                                  email: _email.text,
                                  password: _password.text,
                                  profilePictureUrl: _profilePictureUrl.text,
                                  birthDate: _birthDate.text,
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
                                _fullName.clear();
                                _rg.clear();
                                _cpf.clear();
                                _email.clear();
                                _password.clear();
                                _profilePictureUrl.clear();
                                _birthDate.clear();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            } else {
                              print('Deu merda');
                            }
                          },
                          child: const Text('Entrar'),
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

  final snackBar = const SnackBar(
    content: Text('CPF ou Senha inválidos'),
    backgroundColor: Colors.redAccent,
  );
}
