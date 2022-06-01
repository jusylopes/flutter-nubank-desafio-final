import 'package:flutter/material.dart';
import 'package:projeto_final/external/swagger_api_user_repository.dart';
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
    final userRepository = SwaggerApiUserRepository();

    return Stack(
      children: [
        const BackgroundPage(),        
        Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(180.0),
            child: AppBarWidget(back: false),
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
                        MenuProfile(
                          textAppBar: 'Eventos',
                          iconMenu: Icons.calendar_month_outlined,
                          route:  () {Navigator.pushNamed(context, Routes.event);},                              ,
                        ),
                        MenuProfile(
                          textAppBar: 'Meus dados',
                          iconMenu: Icons.account_circle,
                          route:  () {Navigator.pushNamed(context, Routes.editProfile);},                              ,
                        ),
                        MenuProfile(
                          textAppBar: 'Meu histórico',
                          iconMenu: Icons.chrome_reader_mode,
                          route:  ()  {Navigator.pushNamed(context, Routes.historic);},                              ,
                        ),
                        MenuProfile(
                          textAppBar: 'Contato',
                          iconMenu: Icons.message,
                          route:  ()  {Navigator.pushNamed(context, Routes.historic);},                              ,
                        ),
                      ],
                    ),
                  ),


                  TextButton(
                    onPressed: () async {
                      final todo = await userRepository.getDetailsUser();
                      print(todo.fullName);

                      // final list = await userRepository.getDetailsUser();
                      // print(list);
                    },
                    child: const Text('Testar'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () async {
                      bool saiu = await userRepository.logout();
                      if (saiu) {
                        Navigator.pushNamed(context, Routes.splash);
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
                'Olá, Juliana',
                style: LasTextStyle.txtTitleProfile,
              )),
            )
          ],
        ),
      ],
    );
  }


getNome async {
                      final todo = await userRepository.getDetailsUser();
                      print(todo.fullName);


}

  // Future<bool> logout() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.clear();
  //   return true;
  // }
}
