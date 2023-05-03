import 'package:cae/modules/calcules/views/widgets/rectangleofcalculates.dart';
import 'package:flutter/material.dart';

class CalculosView extends StatelessWidget {
  const CalculosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(children: [
        ItemBox(
          color: Colors.red,
          icon: const Icon(Icons.add),
          text: "Agregar",
          ontap: () {
            debugPrint("HOLA");
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 20, width: 20, color: Colors.red),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 20, width: 20, color: Colors.green),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 20, width: 20, color: Colors.yellow),
        ),
      ]),
    );
  }
}
