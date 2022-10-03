//import 'package:flutter/cupertino.dart';
import 'package:fiado/views/calculos/imc_calculos_view.dart';
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
                      builder: (context) => IndiceDemasaCorporal()));
            },
            child: IconCard(
              ico: Icon(Icons.fastfood_rounded, size: tamaico),
              nombre: "IMC",
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const vistatest2()));
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

class vistatest extends StatelessWidget {
  const vistatest({super.key});

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

class vistatest2 extends StatelessWidget {
  const vistatest2({super.key});

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
