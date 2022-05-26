import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/authentication/authentication_page.dart';
import 'package:projeto_final/ui/views/login/login_page.dart';
import 'package:projeto_final/ui/views/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
          scaffoldBackgroundColor: LasColors.colorBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto'),
      initialRoute: Routes.authentication,
      routes: {
        Routes.splash: (context) => const SplashPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.authentication: (context) => const AuthenticationPage(),
      },
    );
  }
}
