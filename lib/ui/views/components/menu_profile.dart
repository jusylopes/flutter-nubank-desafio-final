import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_text_style.dart';

class MenuProfile extends StatelessWidget {
  final String textAppBar;
  final IconData iconMenu;
  final BuildContext context;
  final String route;

  const MenuProfile(
      {super.key,
      required this.textAppBar,
      required this.iconMenu,
      required this.route,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          color: LasColors.menuProfile,
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Icon(iconMenu,
                          size: 52.0, color: LasColors.txtAppBarProfile)),
                  Text(textAppBar, style: LasTextStyle.appBarProfile),
                ]),
          ),
        ),
      ),
    );
  }
}
