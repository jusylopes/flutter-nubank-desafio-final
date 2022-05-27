import 'package:flutter/material.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';
import 'package:projeto_final/ui/views/components/background_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 / 5.0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundPage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                    width: 350,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 340,
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                      AnimatedRotation(
                          turns: turns,
                          duration: const Duration(seconds: 2),
                          child: SvgPicture.asset('assets/images/Vector1.svg')),
                      Image.asset('assets/images/Vector.png'),
                      SvgPicture.asset('assets/images/las.svg'),
                    ]),
                  ),

                  Container(
                    height: 150,
                    width: 350,
                    alignment: Alignment.topCenter,
                    child: const Text(
                      Strings.appName,
                      style: LasTextStyle.inicialPage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _changeRotation,
                    child: const Text('Rodar logo'),
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
