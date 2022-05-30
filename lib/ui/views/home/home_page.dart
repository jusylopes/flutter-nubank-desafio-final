import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/image_profile.dart';
import 'package:projeto_final/ui/views/components/menu_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [    
        const BackgroundPage(),
        const BackgroundProfile(),
        Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  const ImageProfile(heightContainer: 200),
                  Container(
                    height: 40,
                    alignment: Alignment.bottomCenter,
                    child: const Text('Olá, Marlene',
                        style: LasTextStyle.txtTitleProfile),
                  ),
                  const SizedBox(height: 30.0),
                  Expanded(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: (1 / .6),
                      children: const <Widget>[
                        MenuProfile(
                            textAppBar: 'Eventos',
                            iconMenu: Icons.calendar_month_outlined),
                        MenuProfile(
                            textAppBar: 'Meus dados',
                            iconMenu: Icons.person_pin_circle_rounded),
                        MenuProfile(
                            textAppBar: 'Meu histórico', iconMenu: Icons.book),
                        MenuProfile(
                            textAppBar: 'Contato', iconMenu: Icons.chat),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
