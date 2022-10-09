//import 'package:flutter/cupertino.dart';
import 'package:cae/views/calculos/imc_calculos_view.dart';
import 'package:flutter/material.dart';

import '../../widgets/card.dart';

class PageIMC extends StatelessWidget {
  const PageIMC({super.key});

  @override
  Widget build(BuildContext context) {
    double tamaico = 80;
    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
        child: Wrap(children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IndiceDemasaCorporal()));
            },
            child: IconCard(
              ico: Icon(Icons.fastfood_rounded, size: tamaico),
              nombre: "IMC",
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Vistatest2()));
            },
            child: IconCard(
                ico: Icon(Icons.heart_broken, size: tamaico),
                nombre: "BP o PA "),
          ),
          IconCard(
              ico: Icon(Icons.yard_outlined, size: tamaico), nombre: "Flowers"),
          IconCard(
              ico: Icon(Icons.account_balance_outlined, size: tamaico),
              nombre: "Cuenta"),
          IconCard(
              ico: Icon(Icons.yard_outlined, size: tamaico), nombre: "Flowers"),
          IconCard(
              ico: Icon(Icons.account_balance_outlined, size: tamaico),
              nombre: "Cuenta"),
          IconCard(
              ico: Icon(Icons.yard_outlined, size: tamaico), nombre: "Flowers"),
          IconCard(
              ico: Icon(Icons.account_balance_outlined, size: tamaico),
              nombre: "Cuenta"),
          IconCard(
              ico: Icon(Icons.yard_outlined, size: tamaico), nombre: "Flowers"),
          IconCard(
              ico: Icon(Icons.account_balance_outlined, size: tamaico),
              nombre: "Cuenta"),
          IconCard(
              ico: Icon(Icons.yard_outlined, size: tamaico), nombre: "Flowers"),
          IconCard(
              ico: Icon(Icons.account_balance_outlined, size: tamaico),
              nombre: "Cuenta"),
        ]),
      ),
    );
  }
}

class Vistatest extends StatelessWidget {
  const Vistatest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Indice de masa corporal")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: const [
            Center(
              child: Text("GORDO Y GEY"),
            )
          ],
        ),
      ),
    );
  }
}

class Vistatest2 extends StatelessWidget {
  const Vistatest2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" presion arterial")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: const [
            Center(
              child: Text("PRESION INSANA"),
            )
          ],
        ),
      ),
    );
  }
}
