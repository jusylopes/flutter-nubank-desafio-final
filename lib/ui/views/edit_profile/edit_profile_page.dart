import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/patch/patch_contacts_register_entity.dart';
import 'package:projeto_final/data/entity/patch/patch_user_register_entity.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/alert_dialog.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:flutter/services.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';
import 'package:projeto_final/ui/views/components/form/birthday_date.dart';
import 'package:projeto_final/ui/views/components/form/cpf_field.dart';
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
  Color _colorButton = LasColors.buttonColor;
  String _textButton = Strings.buttonRegister;
  File? imageProfile;
  String? fullName = 'carregando...';
  String? cpf;
  String? email;
  String? phone;
  String? rg;
  String? birthDate;

  void loadUser() async {
    final user = await userRepository.getUserDetails();
    final address = await userRepository.getAddressDetails();
    final contacts = await userRepository.getUserContacts();
    rg = user.rg;
    email = contacts.email;
    fullName = user.fullName;
    cpf = user.cpf;
    phone = contacts.phone;
    birthDate = user.birthDate;

    setState(() {
      _nameController.text = fullName.toString();
      _rgController.text = rg.toString();
      _cpfController.text = cpf.toString();
      _phoneController.text = phone.toString();
      _dateController.text = birthDate.toString();
    });
  }

  void validateSuccess() async {
    setState(() {
      _colorButton = LasColors.buttonColorAwait;
      _textButton = Strings.buttonAwait;
    });

    if (_formKey.currentState!.validate()) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      bool validateUserSucess = await userRepository.patchUserRegister(
        PatchUserRegisterEntity(
          fullName: _nameController.text,
          cpf: _cpfController.text.replaceAll(".", "").replaceAll("-", ""),
          rg: _rgController.text,
          birthDate: _dateController.text.replaceAll("/", ""),
        ),
      );
      bool validateContactsSucess = await userRepository
          .patchContactsRegister(PatchContactsRegisterEntity(
        phone: _phoneController.text
            .replaceAll("(", "")
            .replaceAll(")", "")
            .replaceAll("-", ""),
      ));
      await userRepository.getUserDetails();
      loadUser();
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      if (validateUserSucess && validateContactsSucess) {
        //para retirar erro de gap
        if (!mounted) return;
        showAlertPatch();
      } else {
        setState(() {
          _colorButton = LasColors.buttonColor;
          _textButton = Strings.buttonRegister;
        });
      }
    } else {
      debugPrint('errooo');
    }
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

  void showAlertPatch() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const Alert(
            bodyAlert: Strings.txtPatchSuccess, txtButton: Strings.buttonOk));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(180.0),
            child: AppBarWidget(
              back: true,
            ),
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
                      const TextTileForm(textTitleForm: Strings.txtContact),
                      PhoneField(
                        phoneController: _phoneController,
                      ),
                      const SizedBox(height: 15.0),
                      ButtonWidget(
                        colorButton: LasColors.buttonColor,
                        textButton: Strings.buttonChange,
                        onPressed: validateSuccess,
                      ),
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
