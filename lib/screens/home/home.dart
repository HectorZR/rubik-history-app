import 'package:flutter/material.dart';
import 'package:mobile_app/screens/home/widgets/stop_watch/stop_watch.dart';
import 'package:mobile_app/widgets/custom_scaffold/custom_scaffold.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: StopWatch());
  }
}
