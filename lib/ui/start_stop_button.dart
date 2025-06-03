import 'package:flutter/material.dart';

class StartStopButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isRunning;
  const StartStopButton({
    super.key,
    required this.onPressed,
    required this.isRunning,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: isRunning ? Colors.red[900] : Colors.green[900],
        child: InkWell(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text(isRunning ? 'Stop' : 'Start'),
          ),
        ),
      ),
    );
  }
}
