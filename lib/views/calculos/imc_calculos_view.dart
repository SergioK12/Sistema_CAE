//import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class IndiceDemasaCorporal extends StatefulWidget {
  const IndiceDemasaCorporal({super.key});

  @override
  State<IndiceDemasaCorporal> createState() => _IndiceDemasaCorporalState();
}

class _IndiceDemasaCorporalState extends State<IndiceDemasaCorporal> {
  String estado = '';
  double peso = 0.0;
  double altura = 0.0;
  double resultado = 0.00;
  Color elc = Colors.blueAccent;

  final myControllerpeso = TextEditingController();
  final myControlleraltura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void calcxd(double pes) {
      if (resultado.toString().isEmpty || resultado == 0.00) {
        resultado = 0.00;
        elc = Colors.blue;
        estado = '';
      } else {
        if (resultado <= 18.40 && resultado > 0.00) {
          estado = "Desnuticion";
          elc = Colors.yellow;
        } else if (resultado >= 18.5 && resultado <= 24.999) {
          estado = "Normal";
          elc = Colors.green;
        } else if (resultado >= 25 && resultado <= 29.999) {
          estado = "Sobrepeso";
          elc = Colors.orange;
        } else if (resultado >= 30 && resultado <= 34.999) {
          estado = "Obesidad grado 1";
          elc = Colors.red.shade300;
        } else if (resultado >= 35 && resultado <= 39.999) {
          estado = "Obesidad grado 2";
          elc = Colors.red;
        } else if (resultado > 40 && resultado <= 100) {
          estado = "Obesidad grado 3";
          elc = Colors.red.shade700;
        } else {
          estado = "Ha ocurrido un error";
          elc = Colors.grey;
        }
      }
    }

    resultado = calcular(peso, altura);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true, title: const Text("Indice de masa corporal")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Ingrese el peso(Kg)"),
                Expanded(
                    child: TextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    setState(() {
                      peso = double.tryParse(myControllerpeso.text) ?? 0.00;
                      resultado = calcular(peso, altura);
                      calcxd(resultado);
                    });
                  },
                  controller: myControllerpeso,
                  keyboardType: TextInputType.number,
                )),
                const Text("Ingrese la altura(M)"),
                Expanded(
                    child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                    setState(() {
                      altura = double.tryParse(myControlleraltura.text) ?? 0.00;
                      resultado = calcular(peso, altura);
                      calcxd(resultado);
                    });
                  },
                  controller: myControlleraltura,
                  keyboardType: TextInputType.number,
                )),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                    child: Container(
                        height: 50,
                        color: elc,
                        child: Text(
                          "${resultado.toStringAsFixed(2)}\n $estado",
                          textAlign: TextAlign.center,
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }

  double calcular(double pesox, double alturax) {
    if (alturax == 0 && pesox == 0) {
      return 0.00;
    }
    if (alturax == 0 || pesox == 0) {
      return 0.00;
    }

    double resx = (pesox / (pow(alturax, 2)));
    return resx;
  }
}
