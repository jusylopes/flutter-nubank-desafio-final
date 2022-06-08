import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpinningLogo extends AnimatedWidget {
  const SpinningLogo({
    Key? key,
    required AnimationController controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 1.8 * math.pi,
      child: SizedBox(
          width: 200.0,
          height: 200.0,
          child: SvgPicture.asset('assets/images/Vector1.svg')),
    );
  }
}
