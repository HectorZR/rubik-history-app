import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  const Time(
      {Key? key,
      required this.duration,
      required this.onStartStopwatch,
      required this.onStopStopwatch,
      required this.onResetStopwatch})
      : super(key: key);

  final Duration duration;
  final Function onStopStopwatch;
  final Function onStartStopwatch;
  final Function onResetStopwatch;

  String _getMinutes() {
    if (duration.inMinutes == 0) return '';

    return '${duration.inMinutes.toString().padLeft(2, '0')}:';
  }

  String _getSeconds() {
    return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}.';
  }

  String _getMilliseconds() {
    return (duration.inMilliseconds % 1000).toString().padLeft(3, '0');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onStopStopwatch(),
        onLongPressEnd: (_) => onStartStopwatch(),
        onDoubleTap: () => onResetStopwatch(),
        child: Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.334),
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(_getMinutes(), style: const TextStyle(fontSize: 100)),
                Text(_getSeconds(), style: const TextStyle(fontSize: 100)),
                Text(
                  _getMilliseconds(),
                  style: const TextStyle(fontSize: 50),
                ),
              ],
            )));
  }
}
