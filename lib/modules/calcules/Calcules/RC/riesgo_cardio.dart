import 'package:flutter/material.dart';
class RiesgoCardiovascularView extends StatelessWidget {
  static String routeName = 'RiesgoCardio';

  const RiesgoCardiovascularView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Riesgo Cardio"),),
    );
  }
}