import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/ui/views/components/custom_appBar.dart';

class BackgroundProfile extends StatelessWidget {
  const BackgroundProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 150,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: ClipPath(
        clipper: CustomAppbar(),
        child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: LasColors.appBarEditProfile),
      ),
    );
  }
}
