import 'package:flutter/material.dart';
import 'dart:async';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  bool _isTimeRunning = false;
  Duration _duration = const Duration();
  late Timer timer;

  void _handleStopwatch() {
    setState(() {
      if (_isTimeRunning) {
        _isTimeRunning = false;
        return;
      }

      timer = Timer.periodic(const Duration(milliseconds: 1), (_) {
        _handleStopwatchTick();
      });
      _isTimeRunning = true;

      _resetStopwatch();
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

  String _getTime() {
    final String minutesString = _duration.inMinutes.toString().padLeft(2, '0');
    final String secondsString =
        (_duration.inSeconds % 60).toString().padLeft(2, '0');
    final String milisecondsString =
        (_duration.inMilliseconds % 1000).toString().padLeft(3, '0');
    String time = '';

    if (_duration.inMinutes == 0) {
      time = '$secondsString.$milisecondsString';
    } else {
      time = '$minutesString:$secondsString.$milisecondsString';
    }

    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text(_getTime()),
      ElevatedButton(
        onPressed: _handleStopwatch,
        child: Text(_isTimeRunning ? 'Stop' : 'Start'),
      ),
      ElevatedButton(onPressed: _resetStopwatch, child: const Text('Reset'))
    ]));
  }
}
