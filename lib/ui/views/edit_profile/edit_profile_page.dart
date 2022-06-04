import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/patch/patch_contacts_register_entity.dart';
import 'package:projeto_final/data/entity/patch/patch_user_register_entity.dart';
import 'package:projeto_final/data/repositories/cep/cep_repository.dart';
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
import 'package:projeto_final/ui/views/components/form/custom_text_field.dart';
import 'package:projeto_final/ui/views/components/form/email_field.dart';
import 'package:projeto_final/ui/views/components/form/mobile_fiel.dart';
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
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _complementController = TextEditingController();
  final _cepRepository = CepRepository();
  Color _colorButton = LasColors.buttonColor;
  String _textButton = Strings.buttonRegister;
  String? resultado;
  File? imageProfile;
  String? fullName = 'carregando...';

  String? cpf,
      date,
      rg,
      phone,
      mobile,
      email,
      cep,
      street,
      neighborhood,
      state,
      city,
      complement;
  int? number;


  void loadUser() async {
    final user = await userRepository.getUserDetails();
    final address = await userRepository.getAddressDetails();
    final contacts = await userRepository.getUserContacts();

    // recebendo dados da api
    email = contacts.email;

    fullName = user.fullName;
    cpf = user.cpf;
    rg = user.rg;
    date = user.birthDate;
    phone = contacts.phone;
    mobile = contacts.mobilePhone;
    email = contacts.email;
    cep = address.cep;
    street = address.street;
    number = address.number;
    complement = address.complement;
    neighborhood = address.district;
    city = address.city;
    state = address.state;

    // controller recebendo dados das variaveis
    _nameController.text = fullName.toString();
    _cpfController.text = cpf.toString();
    _emailController.text = email.toString();
    _rgController.text =
        rg.toString().replaceAll('SSP', '').replaceAll('BA', '');
    _dateController.text =
        date.toString().replaceAll('T00:00:00.000Z', '');
    phone != null ? _phoneController.text = phone.toString() : '';
    mobile != null ? _mobileController.text = mobile.toString() : '';
    cep != null ? _cepController.text = cep.toString() : '';
    street != null ? _streetController.text = street.toString() : '';
    number != null ? _numberController.text = number.toString() : '';
    complement != null
        ? _complementController.text = complement.toString()
        : '';
    neighborhood != null
        ? _neighborhoodController.text = neighborhood.toString()
        : '';
    state != null ? _stateController.text = state.toString() : '';
    city != null ? _cityController.text = city.toString() : '';

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

          email: _emailController.text,

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

  void _searchCep() async {
    String cep = _cepController.text;
    final searchCep = await _cepRepository.fetchCep(cep: cep);

    // var recebendo dados da api
    String street = searchCep.street;
    String neighborhood = searchCep.neighborhood;
    String state = searchCep.state;
    String city = searchCep.city;

    // controller recebendo dados das variaveis
    _streetController.text = street;
    _neighborhoodController.text = neighborhood;
    _stateController.text = state;
    _cityController.text = city;
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

  // showDialogImage() {
  //   showDialog<ImageSource>(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //       title: const Text('Alterar foto'),
  //       actions: <Widget>[
  //         IconButton(
  //           icon: const Icon(
  //             Icons.photo_camera,
  //             size: 35.0,
  //             color: LasColors.buttonColor,
  //           ),
  //           onPressed: () {
  //             //  Navigator.pop(context, 'Camera');
  //             pickImage(ImageSource.camera);
  //           },
  //         ),
  //         IconButton(
  //             icon: const Icon(Icons.image,
  //                 size: 35.0, color: LasColors.buttonColor),
  //             onPressed: () {
  //               // Navigator.pop(context, 'Galeria');
  //               pickImage(ImageSource.gallery);
  //             }),
  //       ],
  //     ),
  //   );
  // }

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
                      MobileField(
                        mobileController: _mobileController,
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
                          onChanged: (cepController) {
                            if (cepController.length >= 7) {
                              _searchCep();
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            //Mask.generic(
                            //  masks: ['#####-###'],
                            //  hashtag: Hashtag.numbers,
                            //),
                          ]),
                      const SizedBox(height: 15.0),
                      CustomTextField(
                        controller: _streetController,
                        label: 'Endereço',
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          SizedBox(
                            width: 100.0,
                            child: CustomTextField(
                              controller: _numberController,
                              label: 'Número',
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          Expanded(
                            child: CustomTextField(
                              controller: _neighborhoodController,
                              label: 'Bairro',
                            ),
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
                          Expanded(
                            child: CustomTextField(
                              controller: _cityController,
                              label: 'Cidade',
                            ),
                          ),
                          const SizedBox(width: 15.0),
                          SizedBox(
                            width: 100.0,
                            child: CustomTextField(
                              controller: _stateController,
                              label: 'Estado',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      ButtonWidget(
                        colorButton: LasColors.buttonColor,
                        textButton: Strings.buttonChange,
                        onPressed: validateSuccess,
                      ),
                      const SizedBox(height: 20.0),
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
                      ..onTap = (){
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
                                  },
                              ),
                            ],
                          ),
                        );
                      
                      },
              ),
            ),
            ),
          ],
        ),
      ],
    );
  }
}
