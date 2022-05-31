import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path_0 = Path();
    //double radius = 10;
    path_0.moveTo(size.width * 0.02696660, size.height * 0.2736205);
    path_0.lineTo(size.width * 0.1091835, size.height * 0.7650667);
    path_0.cubicTo(
        size.width * 0.1389442,
        size.height * 0.9430190,
        size.width * 0.3539573,
        size.height * 1.022624,
        size.width * 0.4961408,
        size.height * 0.9083476);
    path_0.lineTo(size.width * 0.8888932, size.height * 0.5927905);
    path_0.cubicTo(
        size.width * 1.031126,
        size.height * 0.4785190,
        size.width * 0.9939223,
        size.height * 0.2561000,
        size.width * 0.8219320,
        size.height * 0.1924186);
    path_0.lineTo(size.width * 0.3470073, size.height * 0.01653129);
    path_0.cubicTo(
        size.width * 0.1750160,
        size.height * -0.04714986,
        size.width * -0.002798811,
        size.height * 0.09571333,
        size.width * 0.02696660,
        size.height * 0.2736205);
    path_0.lineTo(size.width * 0.1091835, size.height * 0.7650667);
    path_0.cubicTo(
        size.width * 0.1389442,
        size.height * 0.9430190,
        size.width * 0.3539573,
        size.height * 1.022624,
        size.width * 0.4961408,
        size.height * 0.9083476);
    path_0.lineTo(size.width * 0.8888932, size.height * 0.5927905);
    path_0.cubicTo(
        size.width * 1.031126,
        size.height * 0.4785190,
        size.width * 0.9939223,
        size.height * 0.2561000,
        size.width * 0.8219320,
        size.height * 0.1924186);
    path_0.lineTo(size.width * 0.3470073, size.height * 0.01653129);
    path_0.cubicTo(
        size.width * 0.1750160,
        size.height * -0.04714986,
        size.width * -0.002798811,
        size.height * 0.09571333,
        size.width * 0.02696660,
        size.height * 0.2736205);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
