import 'package:flutter/material.dart';

class BackgroundCurve extends StatelessWidget {
  const BackgroundCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 180.0),
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(200, 40)),
      ),
    );
  }
}
