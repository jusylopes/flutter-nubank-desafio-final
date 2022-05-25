import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';

abstract class LasTextStyle {
  static var titlePage = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 28.0,
    height: 1.5,
    color: LasColors.textTitleLoginPage,
  );

  static const txtButton = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: LasColors.textButtonColor,
  );

  static const loginPage = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16.0,
    color: LasColors.textLoginPage,
  );

  static const loginPageCreate = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    color: LasColors.textLoginPageCreate,
  );

  static const loginAuthenticationPage = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 38.0,
      color: LasColors.textRegisterPage);

  static const authenticationSubtitle = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 18.0,
      color: LasColors.txtLoginRegisterPageSubtitle);
}
