
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/custom_appBar.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

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
          backgroundColor: LasColors.textButtonColor,
        ),
        Column(
          children: [
            const SizedBox(
              height: 100,
              width: double.infinity,
            ),
            Center(
              child: SizedBox(
                height: 140,
                width: 140,
                child: SvgPicture.asset('assets/images/Vector1.svg'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
