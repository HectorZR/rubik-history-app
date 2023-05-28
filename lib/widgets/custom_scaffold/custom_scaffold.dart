import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/custom_appbar/custom_appbar.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: const CustomAppBar(),
      // Body
      body: body,
    );
  }
}
