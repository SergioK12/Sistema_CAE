import 'dart:math';
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final Icon ico;
  final String nombre;
  const IconCard({super.key, required this.nombre, required this.ico});

  @override
  Widget build(BuildContext context) {
    List<Color> listadecolores = [
      Colors.red,
      Colors.blue,
      Colors.amber,
      Colors.green,
      Colors.grey,
      Colors.deepPurpleAccent,
      Colors.indigo,
      Colors.pink,
      Colours.aqua,
      Colours.aquamarine,
      Colours.blueViolet,
      Colours.burlyWood,
      Colours.burntSienna,
      Colours.cadetBlue,
      Colours.chartReuse,
      Colours.chocolate,
      Colours.coral,
      Colours.cornFlowerBlue,
      Colours.crimson,
    ];
    var intValue = Random().nextInt(18);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 95,
        height: 95,
        color: listadecolores.elementAt(intValue),
        child: Column(
          children: [
            Container(
              child: ico,
            ),
            Text(
              nombre,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
