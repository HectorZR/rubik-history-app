import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mobile_app/screens/home/widgets/stop_watch/widgets/time.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  bool _isTimeRunning = false;
  Duration _duration = const Duration();
  late Timer timer;

  void _startStopwatch() {
    setState(() {
      timer = Timer.periodic(const Duration(milliseconds: 1), (_) {
        _handleStopwatchTick();
      });
      _isTimeRunning = true;

      _resetStopwatch();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _isTimeRunning = false;
    });
  }

  void _handleStopwatchTick() {
    setState(() {
      if (_isTimeRunning) {
        _duration += const Duration(milliseconds: 1);
        return;
      }
      timer.cancel();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _duration = const Duration();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Time(
          duration: _duration,
          onStartStopwatch: _startStopwatch,
          onStopStopwatch: _stopStopwatch,
          onResetStopwatch: _resetStopwatch),
    );
  }
}
