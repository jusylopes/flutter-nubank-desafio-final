import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/external/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:flutter/services.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';
import 'package:projeto_final/ui/views/components/form/birthday_date.dart';
import 'package:projeto_final/ui/views/components/form/cpf_field.dart';
import 'package:projeto_final/ui/views/components/form/custom_text_field.dart';
import 'package:projeto_final/ui/views/components/form/email_field.dart';
import 'package:projeto_final/ui/views/components/form/name_field.dart';
import 'package:projeto_final/ui/views/components/form/rg_field.dart';
import 'package:projeto_final/ui/views/components/text_title_form.dart';
import 'dart:async';
import 'dart:io';

import 'package:projeto_final/ui/views/components/image_profile.dart';

import '../components/form/phone_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _rgController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final userRepository = SwaggerApiUserRepository();
  final _cepController = TextEditingController();
  final _addressController = TextEditingController();
  final _numberController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _complementController = TextEditingController();

  File? imageProfile;
  String? fullName = 'carregando...';
  String? cpf,
      date,
      rg,
      phone,
      mobile,
      email,
      cep,
      address,
      number,
      neighborhood,
      country,
      city,
      complement;

  void loadUser() async {
    final user = await userRepository.getDetailsUser();
    fullName = user.fullName;
    cpf = user.cpf;
    rg = user.rg;

    setState(() {
      _nameController.text = fullName.toString();
      _cpfController.text = cpf.toString();
      _rgController.text = rg.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  //upload de imagem - alice
  Future pickImage(ImageSource source) async {
    try {
      final imageProfile = await ImagePicker().pickImage(source: source);
      if (imageProfile == null) return;
      final imageTemporary = File(imageProfile.path);
      setState(() => this.imageProfile = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('Falha ao pegar a imagem : $e');
    }
  }

  showDialogImage() {
    showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Alterar foto'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.photo_camera,
              size: 35.0,
              color: LasColors.buttonColor,
            ),
            onPressed: () {
              //  Navigator.pop(context, 'Camera');
              pickImage(ImageSource.camera);
            },
          ),
          IconButton(
              icon: const Icon(Icons.image,
                  size: 35.0, color: LasColors.buttonColor),
              onPressed: () {
                // Navigator.pop(context, 'Galeria');
                pickImage(ImageSource.gallery);
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(180.0),
            child: AppBarWidget(back: true),
          ),
          body: Column(
            children: <Widget>[
              const SizedBox(height: 90.0),
              Form(
                key: _formKey,
                child: Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: <Widget>[
                      //dados pessoais
                      const TextTileForm(textTitleForm: Strings.txtDados),
                      NameField(
                        nameController: _nameController,
                      ),
                      const SizedBox(height: 15.0),
                      BirthdayDate(
                        dateController: _dateController,
                      ),
                      const SizedBox(height: 15.0),
                      RgField(
                        rgController: _rgController,
                      ),
                      const SizedBox(height: 15.0),
                      CpfField(
                        cpfController: _cpfController,
                      ),
                      //contatos
                      const TextTileForm(textTitleForm: Strings.txtContact),
                      PhoneField(
                        phoneController: _phoneController,
                      ),
                      const SizedBox(height: 15.0),
                      EmailField(
                        emailController: _emailController,
                      ),
                      //endereco
                      const TextTileForm(textTitleForm: Strings.txtAddress),
                      CustomTextField(
                          controller: _cepController,
                          keyboardType: TextInputType.number,
                          label: 'CEP',
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CepInputFormatter(),
                          ]),
                      const SizedBox(height: 15.0),
                      CustomTextField(
                        controller: _addressController,
                        label: 'Endereço',
                      ),
                      Row(
                        children: [
                          CustomTextField(
                            controller: _numberController,
                            keyboardType: TextInputType.number,
                            label: 'Número',
                          ),
                          CustomTextField(
                            controller: _neighborhoodController,
                            label: 'Bairro',
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      CustomTextField(
                        controller: _complementController,
                        label: 'Complemento',
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          CustomTextField(
                            controller: _cityController,
                            label: 'Cidade',
                          ),
                          CustomTextField(
                            controller: _countryController,
                            label: 'Estado',
                          ),
                        ],
                      ),

                      ButtonWidget(
                          colorButton: LasColors.buttonColor,
                          textButton: Strings.buttonChange,
                          onPressed: () {})
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              height: 180,
              child: Stack(alignment: Alignment.center, children: <Widget>[
                Image.asset(
                  'assets/images/Vector1.png',
                  height: 175,
                ),
                const ImageProfile(),
              ]),
            ),
            Container(
              height: 30,
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                  text: (fullName != null) ? fullName : 'carregando...',
                  style: LasTextStyle.nameAppbar,
                ),
              ),
            ),
            Container(
              height: 20,
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                    text: Strings.changePhoto,
                    style: LasTextStyle.loginCreate,
                    recognizer: TapGestureRecognizer()
                      ..onTap = showDialogImage),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
