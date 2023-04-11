import 'package:flutter/material.dart';

class AlarmsView extends StatefulWidget {
  const AlarmsView({super.key});

  @override
  State<AlarmsView> createState() => _AlarmsViewState();
}

class _AlarmsViewState extends State<AlarmsView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Alarma"),
    );
  }
}