import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondFirstCurved = Offset(0, size.height - 20);
    final secondLasttCurved = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondFirstCurved.dx, secondFirstCurved.dy,
        secondLasttCurved.dx, secondLasttCurved.dy);

    final thirdFirstCurved = Offset(size.width, size.height - 20);
    final thirdLasttCurved = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurved.dx, thirdFirstCurved.dy,
        thirdLasttCurved.dx, thirdLasttCurved.dy);

    path.lineTo(size.width, 0);
    path.close;
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
