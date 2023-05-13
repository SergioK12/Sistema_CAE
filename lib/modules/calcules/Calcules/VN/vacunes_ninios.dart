import 'package:flutter/material.dart';
class VacunasNiniosView extends StatelessWidget {
  static String routeName = 'Vacunes';

  const VacunasNiniosView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Vacunas en niños"),),
    );
  }
}