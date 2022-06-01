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
import 'dart:async';
import 'dart:io';

import 'package:projeto_final/ui/views/components/image_profile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final userRepository = SwaggerApiUserRepository();
  File? imageProfile;
  String? fullName;

  void loadUser() async {
    final user = await userRepository.getDetailsUser();
    setState(() {
      fullName = user.fullName;
    });
  }

  void getName() {}

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
        const Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(180.0),
            child: AppBarWidget(back: true),
          ),
        ),
        Column(
          children: [
            Stack(
              children: [
                const SizedBox(height: 90.0),
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
              ],
            ),
            Container(
              height: 30,
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                  text: (fullName != null) ? '$fullName' : 'carregando...',
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
                      ..onTap = () {
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
                      }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
