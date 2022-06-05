import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/contact/contact_page.dart';
import 'package:projeto_final/ui/views/historic/historic_detalhes.dart';
import 'package:projeto_final/ui/views/historic/historic_page.dart';

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
      initialRoute: Routes.historic,
      routes: {
        // Routes.splash: (context) => const SplashPage(),
        // Routes.inicial: (context) => const InicialPage(),
        // Routes.login: (context) => const LoginPage(),
        // Routes.register: (context) => const RegisterPage(),
        // Routes.editProfile: (context) => const EditProfilePage(),
        // Routes.home: (context) => BlocProvider(
        //       create: (_) => HomePageCubit(SwaggerApiUserRepository()),
        //       child: const HomePage(),
        //     ),
        // Routes.event: (context) => EventPage(),
        // Routes.eventDetails: (context) => const EventDetailsPage(),
        // Routes.accreditation: (context) => const AccreditationPage(),
        Routes.historic: (context) => const HistoricPage(),
        Routes.historicDetails: (context) => const HistoricDetailsPage(),
        Routes.contact: (context) => const ContactPage(),
      },
    );
  }
}
