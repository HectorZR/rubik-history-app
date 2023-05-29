import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/screens/home/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const RubiksTimerApp()));
}

class RubiksTimerApp extends StatelessWidget {
  const RubiksTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rubiks Cube Timer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.cyan, background: Colors.cyan),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
