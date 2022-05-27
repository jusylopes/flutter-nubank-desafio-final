import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';

abstract class LasTextStyle {
  static var titleInicialPage = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 28.0,
    height: 1.5,
    color: LasColors.textTitleInitialPage,
  );

  static const txtButton = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: LasColors.textButtonColor,
  );

  static const inicialPage = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16.0,
    color: LasColors.textLoginPage,
  );

  static const loginCreate = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    color: LasColors.textLoginPageCreate,
  );

  static const titleLoginPage = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 38.0,
      color: LasColors.textRegisterPage);

  static const loginSubtitle = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 18.0,
      color: LasColors.txtLoginRegisterPageSubtitle);

  static const txtalertWidget = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
      color: LasColors.txtAlertWidget);

  static const alertWidgetButton = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 19.0,
      color: LasColors.textButtonColor);

  static const titlePageRegister = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 38.0,
    height: 1.5,
    color: LasColors.textRegisterPage,
  );
  static const registerSubtitle = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 16.0,
      color: LasColors.txtLoginRegisterPageSubtitle);
}
