import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/router/routers.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:projeto_final/ui/views/components/image_profile.dart';
import 'package:projeto_final/ui/views/components/menu_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(180.0),
            child: AppBarWidget(),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 90.0),
                  Expanded(
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 12,
                      crossAxisCount: 2,
                      childAspectRatio: (1 / .6),
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.zero,
                          child: InkWell(
                            onTap: () {},
                            child: const MenuProfile(
                                textAppBar: 'Eventos',
                                iconMenu: Icons.calendar_month_outlined),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.editProfile);
                            },
                            child: const MenuProfile(
                                textAppBar: 'Meus dados',
                                iconMenu: Icons.account_circle),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.zero,
                            child: const MenuProfile(
                                textAppBar: 'Meu histórico',
                                iconMenu: Icons.chrome_reader_mode),
                          ),
                        ),
                        Material(
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.zero,
                            child: const MenuProfile(
                                textAppBar: 'Contato', iconMenu: Icons.message),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              height: 180,
              child: const ImageProfile(),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: const Center(
                  child: Text(
                'Olá, Juliana',
                style: LasTextStyle.txtTitleProfile,
              )),
            )
          ],
        ),
      ],
    );
  }
}
