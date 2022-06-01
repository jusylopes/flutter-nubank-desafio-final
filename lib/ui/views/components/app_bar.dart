import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/ui/views/components/custom_appBar.dart';

class AppBarWidget extends StatelessWidget {
  final bool back;

  const AppBarWidget({super.key, required this.back});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(180.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: back,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: CustomAppbar(),
          child: Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            color: LasColors.appBarEditProfile,
          ),
        ),
      ),
    );
  }
}
