import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_final/resources/las_strings.dart';
import 'package:projeto_final/resources/las_text_style.dart';

import '../components/background.dart';

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({
    Key? key,
    required AnimationController controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: SizedBox(width: 200.0, height: 200.0,  child: SvgPicture.asset('assets/images/Vector1.svg')),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  SizedBox(
                    height: 340,
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                      SpinningContainer(controller: _controller),
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
                      style: LasTextStyle.titleInicialPage,
                      textAlign: TextAlign.center,
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

