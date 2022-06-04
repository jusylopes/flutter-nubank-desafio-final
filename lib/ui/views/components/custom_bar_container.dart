import 'package:flutter/material.dart';

import 'custom_appbar.dart';

// Para ampliar a imagem de fundo do background cobrindo ate o appbar
class CustomBarContainer extends StatelessWidget {
  final String titleappbarhistoric;

  const CustomBarContainer({Key? key, required this.titleappbarhistoric})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomAppbar(),
      child: Container(
        alignment: Alignment.center,
        height: 160,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 1, 117, 180),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            const Spacer(),
            Text(
              titleappbarhistoric,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: Container()),
          ],
        ),
      ),
    );
  }
}
