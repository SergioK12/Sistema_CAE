import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IndiceDemasaCorporal extends StatelessWidget {
  String estado = " ";
  int dato = 1;

  IndiceDemasaCorporal({super.key});
  @override
  Widget build(BuildContext context) {
    final String estado = test(1);
    final numerodelapalabra = resdeltest(estado);
    final Color elc = colorfinal(numerodelapalabra);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true, title: const Text("Indice de masa corporal")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: const [
                Text("Ingrese el peso"),
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
            Row(
              children: const [
                Text("Ingrese la altura"),
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
            Row(
              children: [Container(color: elc, child: Text(estado))],
            )
          ],
        ),
      ),
    );
  }

  String test(int dato) {
    String xd = " ";
    switch (dato) {
      case 1:
        return "Bien";
      case 2:
        return "Sobrepeso";
      case 3:
        return "Desnutricion";
    }
    return xd;
  }

  int resdeltest(String palabra) {
    int elnumero = 0;
    switch (palabra) {
      case "Bien":
        elnumero = 1;
        break;
      case "Sobrepeso":
        elnumero = 2;
        break;
      case "Desnutricion":
        elnumero = 3;
        break;
    }
    return elnumero;
  }

  Color colorfinal(int x) {
    Color col = Colors.red;
    switch (x) {
      case 1:
        col = Colors.red;
        break;
      case 2:
        col = Colors.green;
        break;
      case 3:
        col = Colors.white;
    }

    return col;
  }
}
