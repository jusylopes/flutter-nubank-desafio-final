import 'package:flutter/material.dart';
import 'package:projeto_final/external/swagger_api_user_repository.dart';
import 'package:projeto_final/ui/views/initial/inicial_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userRepository = SwaggerApiUserRepository();
  @override
  Widget build(BuildContext context) {
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
              onPressed: () async {
                bool saiu = await userRepository.logout();
                if (saiu) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InitialPage(),
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

  // Future<bool> logout() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.clear();
  //   return true;
  // }
}
