import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:interactive_stop_watch/ui/reset_button.dart';
import 'package:interactive_stop_watch/ui/start_stop_button.dart';
import 'package:interactive_stop_watch/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  Duration get _elapsed => _previouslyElapsed + _currentlyElapsed;

  late final Ticker _ticker;
  bool _isRunning = false;

  @override
  void initState() {
    _ticker = Ticker(
      (elapsed) {
        setState(() {
          _currentlyElapsed = elapsed;
        });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _handleStartStop() {
    if (_isRunning) {
      setState(() {
        _isRunning = false;
      });
      _previouslyElapsed += _currentlyElapsed;
      _currentlyElapsed = Duration.zero;
      _ticker.stop();
    } else {
      setState(() {
        _isRunning = true;
      });
      _ticker.start();
    }
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _previouslyElapsed = Duration.zero;
      _currentlyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final radius = constraints.maxWidth / 2;
      return Stack(
        children: [
          StopwatchRenderer(
            elapsed: _elapsed,
            radius: radius,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ResetButton(
                onPressed: _reset,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              height: 80,
              child: StartStopButton(
                isRunning: _isRunning,
                onPressed: _handleStartStop,
              ),
            ),
          )
        ],
      );
    });
  }
}
