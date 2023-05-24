import 'dart:math';

import 'package:flutter/material.dart';

class IMCProvider extends ChangeNotifier {
  var peso = 0.0;
  var altura = 0.0;
  var estadoPx = Estados.normal.name;
  var res = 0.0;
  Color elcolor = Colors.grey;
  var isInCM = false;
  var isInKG = false;
  double getpeso() {
    return peso;
  }

  void setpeso(double pesorecibido) {
    peso = pesorecibido;
    notifyListeners();
  }

  double getaltura() {
    return altura;
  }

  void setaltura(double alturarecibida) {
    altura = alturarecibida;
    notifyListeners();
  }

  void setAltura(double alturarecibida) {
    altura = alturarecibida;
    notifyListeners();
  }

  void calcularimc() {
    if (altura == 0 && peso == 0) {
      setstatus("Ingrese los datos");
    }

    if (altura == 0) {
      setstatus('Ingresa la altura');
    }

    if (peso == 0) {
      setstatus('Ingresa el peso');
    }
    final double result = peso / ((pow(altura, 2) * 0.0001));
    setres(result);
    if (result < 16 && result >= 1) {
      setcolor(Colors.yellow);
      setstatus(Estados.infrapeso1.name);
    } else if (result >= 16.00 && result <= 16.99) {
      setcolor(Colors.yellow);
      setstatus(Estados.infrapeso2.name);
    } else if (result >= 17.00 && result <= 18.49) {
      setcolor(Colors.yellow);
      setstatus(Estados.infrapeso3.name);
    } else if (result >= 18.50 && result <= 24.99) {
      setcolor(Colors.green);
      setstatus(Estados.normal.name);
    } else if (result >= 25.00 && result <= 29.99) {
      setcolor(Colors.red);
      setstatus(Estados.sobrepeso.name);
    } else if (result >= 30.00 && result <= 34.99) {
      setcolor(Colors.red);
      setstatus(Estados.obeso1.name);
    } else if (result >= 35.00 && result <= 40.99) {
      setcolor(Colors.red);
      setstatus(Estados.infrapeso2.name);
    } else if (result >= 40.0) {
      setcolor(Colors.red);
      setstatus(Estados.obeso3.name);
    }
  }

  void setstatus(String x) {
    estadoPx = x;
  }

  String getstatus() {
    return estadoPx;
  }

  void setres(double resultx) {
    res = resultx;
    notifyListeners();
  }

  String getrest() {
    return res.toString();
  }

  Color getcolor() {
    return elcolor;
  }

  void setcolor(Color colx) {
    elcolor = colx;
  }
}

enum Estados {
  infrapeso1,
  infrapeso2,
  infrapeso3,
  normal,
  sobrepeso,
  obeso1,
  obeso2,
  obeso3
}
