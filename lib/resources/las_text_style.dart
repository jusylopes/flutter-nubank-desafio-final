import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';

abstract class LasTextStyle {
  static const titleInicialPage = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 29.0,
    color: LasColors.textTitleInitialPage,
  );

  static const txtButton = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: LasColors.txtButtonColor,
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
      fontWeight: FontWeight.w600,
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
      color: LasColors.txtButtonColor);

  static const titlePageRegister = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 38.0,
    height: 1.5,
    color: LasColors.textRegisterPage,
  );
  static const registerSubtitle = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16.0,
    color: LasColors.txtLoginRegisterPageSubtitle,
  );

  static const titleAccreditationPage = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
    color: LasColors.textButtonColor,
  );

  static const termAccreditationPage = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: LasColors.textLoginPage,
  );

  static const buttonPdfAccreditationPage = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: LasColors.textButtonPdfColor,
  );

  static const checkAccreditationPage = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: LasColors.textLoginPage,
  );

  static const buttonAccreditationPage = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: LasColors.textButtonColor,
  );

  static const msgConfirmAccreditation = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24.0,
    color: LasColors.texmsgconfirmAccreditation,
  );

  static const appBarProfile = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 17.0,
      color: LasColors.txtAppBarProfile);

  static const txtTitleProfile = TextStyle(
    fontFamily: 'Roboto-Medium',
    fontWeight: FontWeight.w500,
    fontSize: 25.0,
    color: LasColors.txtTitleProfile,
    decoration: TextDecoration.none,
  );

  static const txtEdit = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
    color: LasColors.txtButtonColor,
  );

  static const nameAppbar = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 21.0,
    color: LasColors.textLoginPage,
  );

  static const txtEditDados = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 19.0,
    color: LasColors.textLoginPage,
  );
  static const txtCardHomePageTtile = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22.0,
    color: LasColors.textButtonColor,
  );

  static const txtCardHomePageSubTtile = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: LasColors.textButtonColor,
  );
}
