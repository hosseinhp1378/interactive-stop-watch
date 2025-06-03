import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const ResetButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.grey,
        child: InkWell(
          onTap: onPressed,
          child: Align(
            alignment: Alignment.center,
            child: Text('Reset'),
          ),
        ),
      ),
    );
  }
}
