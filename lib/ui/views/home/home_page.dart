import 'package:flutter/material.dart';
import 'package:projeto_final/data/entity/token_entity.dart';
import 'package:projeto_final/external/swagger_api_user_repository.dart';
import 'package:projeto_final/ui/views/initial/inicial_page.dart';
import 'package:projeto_final/ui/views/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    token();
  }

  @override
  Widget build(BuildContext context) {
    final userRepository = SwaggerApiUserRepository();
    final sharedPreferences = SharedPreferences.getInstance();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Home Page',
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: (() async {
                userRepository.getDetailsUser();
              }),
              child: const Text('Get'),
            ),
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
