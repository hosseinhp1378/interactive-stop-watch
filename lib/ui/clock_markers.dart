// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  const ClockSecondsTickMarker({
    super.key,
    required this.seconds,
    required this.radius,
  });
  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey.shade700;
    const width = 2.0;
    const height = 12.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(
          -width / 2,
          -height / 2,
          0,
        )
        ..rotateZ(2 * pi * (seconds / 60.0))
        ..translate(0.0, radius - height / 2, 0.0),
      // ..translate(0, (radius - height) / 2, 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class ClockTextMarkers extends StatelessWidget {
  final int value;
  final int maxValue;
  final double radius;
  const ClockTextMarkers({
    super.key,
    required this.value,
    required this.maxValue,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    const double width = 30;
    const double height = 20;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(
          -width / 2,
          -height / 2,
          0,
        )
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - height / 0.7, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      // ..rotateZ(pi * 3),
      // ..translate(0, (radius - height) / 2, 0.0),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
