import 'package:flutter/material.dart';
import 'package:projeto_final/external/swagger_api_user_repository.dart';
import 'package:projeto_final/ui/views/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/app_bar.dart';
import 'package:projeto_final/ui/views/components/background.dart';
import 'package:projeto_final/ui/views/components/image_profile.dart';
import 'package:projeto_final/ui/views/components/menu_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userRepository = SwaggerApiUserRepository();
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
                      children: const <Widget>[
                        MenuProfile(
                            textAppBar: 'Eventos',
                            iconMenu: Icons.calendar_month_outlined),
                        MenuProfile(
                            textAppBar: 'Meus dados',
                            iconMenu: Icons.account_circle),
                        MenuProfile(
                            textAppBar: 'Meu histórico',
                            iconMenu: Icons.chrome_reader_mode),
                        MenuProfile(
                            textAppBar: 'Contato', iconMenu: Icons.message),
                      ],
                    ),
                  ),

                  //Isa adicionou
                  TextButton(
                    onPressed: () async {
                      bool saiu = await userRepository.logout();
                      if (saiu) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SplashPage(),
                          ),
                        );
                      }
                    },
                    child: const Text('Sair'),
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
                'Olá, Marlene',
                style: LasTextStyle.txtTitleProfile,
              )),
            )
          ],
        ),
      ],
    );
  }

  Future<void> token() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
  }

  // Future<bool> logout() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.clear();
  //   return true;
  // }
}
