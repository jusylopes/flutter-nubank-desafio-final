import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_colors.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/ui/views/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        primaryColor: LasColors.primaryColor,
        scaffoldBackgroundColor: LasColors.backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto'
      ),
      home: const HomePage(),
    );
  }
}
