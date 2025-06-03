import 'package:flutter/material.dart';

class ElapsedTimeTextBasic extends StatelessWidget {
  final Duration elapsed;
  const ElapsedTimeTextBasic({
    super.key,
    required this.elapsed,
  });

  @override
  Widget build(BuildContext context) {
    final hundreds = (elapsed.inMilliseconds / 10) % 100;
    final seconds = elapsed.inSeconds % 60;
    final minutes = elapsed.inMinutes % 60;
    final hundredsStr = hundreds.toStringAsFixed(0).padLeft(2, '0');
    final secondsStr = seconds.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$minutesStr:$secondsStr:$hundredsStr',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}
