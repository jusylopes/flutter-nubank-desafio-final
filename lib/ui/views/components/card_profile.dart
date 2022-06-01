import 'package:flutter/material.dart';

class CardEventos extends StatelessWidget {
  const CardEventos(
      {Key? key,
      required this.festas,
      required this.credenciais,
      required this.infobotao,
      required this.onPressed})
      : super(key: key);

  final String festas;
  final String credenciais;
  final String infobotao;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/carnaval.jpg',
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              festas,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              credenciais,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 65,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: onPressed,
                child: Text(infobotao))
          ],
        ),
      ],
    );
  }
}
