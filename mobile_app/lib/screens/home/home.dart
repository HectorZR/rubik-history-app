import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/custom_scaffold/custom_scaffold.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: Center(child: Text('Home')));
  }
}
