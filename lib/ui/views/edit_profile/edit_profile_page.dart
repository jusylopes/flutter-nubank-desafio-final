import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/custom_appBar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:projeto_final/ui/views/edit_profile/triangle_clip.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? imageProfile;

  Future pickImage(ImageSource source) async {
    try {
      final imageProfile = await ImagePicker().pickImage(source: source);
      if (imageProfile == null) return;
      final imageTemporary = File(imageProfile.path);
      setState(() => this.imageProfile = imageTemporary);
    } on PlatformException catch (e) {
      print('Falha ao pegar a imagem : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 150,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: ClipPath(
              clipper: CustomAppbar(),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: LasColors.appBarEditProfile,
                child: Stack(
                  children: [
                    Column(
                      children: const [
                        SizedBox(
                          height: 38,
                          width: double.infinity,
                        ),
                        Text(Strings.txtMyHistoric,
                            style: LasTextStyle.txtEdit,
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: LasColors.txtButtonColor,
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
              width: double.infinity,
            ),
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: 140,
                    width: 140,
                    child: SvgPicture.asset('assets/images/VectorApp.svg'),
                  ),
                ),
                Center(
                  child: imageProfile != null
                      ? ClipPath(
                          clipper: TriangleClipper(),
                          child: Image.file(
                            imageProfile!,
                            height: 150,
                            width: 150,
                          ),
                        )
                      : Image.asset(
                          'assets/images/logo.png',
                        ),
                ),
              ],
            ),
            Container(
              height: 30,
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: const TextSpan(
                  text: Strings.nameAppBar,
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
