import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interactive_stop_watch/ui/clock_hand.dart';
import 'package:interactive_stop_watch/ui/clock_markers.dart';
import 'package:interactive_stop_watch/ui/elapsed_time_text_basic.dart';

class StopwatchRendere extends StatelessWidget {
  const StopwatchRendere({
    super.key,
    required this.elapsed,
    required this.radius,
  });

  final Duration elapsed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //       border: Border.all(width: 3, color: Colors.orange),
        //       borderRadius: BorderRadius.circular(radius)),
        // ),
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(seconds: i, radius: radius),
          ),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: ClockTextMarkers(
              value: i,
              radius: radius,
              maxValue: 60,
            ),
          ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            handThickness: 2,
            handLength: radius,
            color: Colors.orange,
          ),
        ),
        // Transform(
        //   transform: Matrix4.identity()
        //     ..translate(50.0, 0, 0)
        //     ..rotateZ(pi / 4),
        //   alignment: Alignment.center,
        //   child: Container(
        //     color: Colors.indigo,
        //   ),
        // ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeTextBasic(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
