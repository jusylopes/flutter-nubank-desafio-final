import 'package:flutter/material.dart';
import 'package:mask/mask/mask.dart';
import 'package:mask/models/hashtag_is.dart';
import 'package:projeto_final/data/entity/user/patch/patch_address_register.dart';
import 'package:projeto_final/data/entity/user/patch/patch_contacts_register_entity.dart';
import 'package:projeto_final/data/entity/user/patch/patch_user_register_entity.dart';
import 'package:projeto_final/data/repositories/cep/cep_repository.dart';
import 'package:projeto_final/data/repositories/swagger_api_user_repository.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/alert_dialog.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/ui/views/components/button_widget.dart';
import 'package:projeto_final/ui/views/components/form/birthday_date.dart';
import 'package:projeto_final/ui/views/components/form/cpf_field.dart';
import 'package:projeto_final/ui/views/components/form/custom_text_field.dart';
import 'package:projeto_final/ui/views/components/form/email_field.dart';
import 'package:projeto_final/ui/views/components/form/mobile_fiel.dart';
import 'package:projeto_final/ui/views/components/form/name_field.dart';
import 'package:projeto_final/ui/views/components/form/phone_field.dart';
import 'package:projeto_final/ui/views/components/form/rg_field.dart';
import 'package:projeto_final/ui/views/components/text_title_form.dart';
import 'package:projeto_final/ui/views/components/image_profile.dart';

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
  String? fullName = 'carregando...';
  // var inputFormat = DateFormat('dd/MM/yyyy');
  Color _colorButton = LasColors.buttonColor;
  String _textButton = Strings.buttonRegister;

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
    _nameController.text = fullName.toString();
    _cpfController.text = cpf.toString();
    _emailController.text = email.toString();
    _rgController.text = rg.toString();
    date != null ? _dateController.text = date.toString() : '';
    _dateController.text = date.toString().replaceAll('T00:00:00.000Z', '');
    adjustDateInitial();
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
    setState(() {
      _nameController.text;
      _dateController.text;
    });
  }

  void validateSuccess() async {
    setState(() {
      _colorButton = LasColors.buttonColorAwait;
      _textButton = Strings.buttonAwait;
    });

    if (_formKey.currentState!.validate()) {
      adjustDateFinal();
      bool validateUserSucess = await userRepository.patchUserRegister(
        PatchUserRegisterEntity(
          fullName: _nameController.text,
          cpf: _cpfController.text.replaceAll(".", "").replaceAll("-", ""),
          rg: _rgController.text,
          birthDate: _dateController.text.replaceAll("/", "-"),
          email: _emailController.text,
        ),
      );
      bool validateContactsSucess = await userRepository.patchContactsRegister(
        PatchContactsRegisterEntity(
            email: _emailController.text,
            mobilePhone: _mobileController.text.replaceAll("-", ""),
            phone:
                _phoneController.text.replaceAll("-", "").replaceAll("#", "")),
      );

      bool validateAddressSucess =
          await userRepository.patchAddressRegister(PatchAddressRegisterEntity(
        cep: _cepController.text.replaceAll("#", "").replaceAll("-", ""),
        street: _streetController.text,
        number: _numberController.text,
        complement: _complementController.text,
        district: _neighborhoodController.text,
        city: _cityController.text,
        state: _stateController.text,
      ));
      loadUser();

      if (validateUserSucess &&
          validateContactsSucess &&
          validateAddressSucess) {
        if (!mounted) return;

        showAlertPatch();
      } else {
        showAlertPatchError();
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

    String street = searchCep.street;
    String neighborhood = searchCep.neighborhood;
    String state = searchCep.state;
    String city = searchCep.city;
    _streetController.text = street;
    _neighborhoodController.text = neighborhood;
    _stateController.text = state;
    _cityController.text = city;
  }

  @override
  void initState() {
    super.initState();
    loadUser();
    _nameController;
  }

  void showAlertPatch() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const Alert(
            bodyAlert: Strings.txtPatchSuccess, txtButton: Strings.buttonOk));
  }

  void showAlertPatchError() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const Alert(
            bodyAlert: 'Erro ao alterar dados.', txtButton: Strings.buttonOk));
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
                      MobileField(
                        mobileController: _mobileController,
                      ),
                      const SizedBox(height: 15.0),
                      EmailField(
                        emailController: _emailController,
                      ),
                      const TextTileForm(textTitleForm: Strings.txtAddress),
                      CustomTextField(
                          controller: _cepController,
                          keyboardType: TextInputType.number,
                          label: 'CEP',
                          onChanged: (cepController) {
                            if (cepController.length >= 8) {
                              _searchCep();
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            Mask.generic(
                              masks: ['#####-###'],
                              hashtag: Hashtag.numbers,
                            ),
                          ]),
                      const SizedBox(height: 15.0),
                      CustomTextField(
                        controller: _streetController,
                        label: 'Endere??o',
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          SizedBox(
                            width: 100.0,
                            child: CustomTextField(
                              controller: _numberController,
                              label: 'N??mero',
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
              margin: const EdgeInsets.only(top: 80),
              height: 160,
              child: Stack(alignment: Alignment.center, children: <Widget>[
                Image.asset(
                  'assets/images/Vector1.png',
                  height: 175,
                ),
                const ImageProfile(),
              ]),
              //RETIRADO IMPLEMENTACAO DE ALTERAR FOTO
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
          ],
        ),
        const SizedBox(
          height: 100.0,
          child: Center(
            child: Text('Meus Dados', style: LasTextStyle.txtTitlePages),
          ),
        )
      ],
    );
  }

  void adjustDateInitial() {
    List<String> campos = _dateController.text.split('-');
    int dia = int.parse(campos[2]);
    int mes = int.parse(campos[1]);
    int ano = int.parse(campos[0]);
    _dateController.text = '$dia-$mes-$ano'.replaceAll('-', '/');
  }

  void adjustDateFinal() {
    List<String> campos = _dateController.text.split('/');
    int dia = int.parse(campos[0]);
    int mes = int.parse(campos[1]);
    int ano = int.parse(campos[2]);
    _dateController.text = '$ano-$mes-${dia}T00:00:00.000Z';
  }
}
