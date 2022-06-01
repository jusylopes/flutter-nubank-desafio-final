import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/ui/views/components/custom_appBar.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: ClipPath(
        clipper: CustomAppbar(),
        child: Container(
          height: 160,
          width: MediaQuery.of(context).size.width,
          color: LasColors.appBarEditProfile,
        ),
      ),
    );
  }
}
