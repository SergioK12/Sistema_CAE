import 'dart:math';

import 'package:flutter/material.dart';

class IMCProvider extends ChangeNotifier {
  var peso = 0.0;
  var altura = 0.0;
  var estadoPx = Estados.normal.name;
  var res = 0.0;

  String getstatus() {
    return estadoPx;
  }

  String getpeso() {
    return peso.toString();
  }

  void setpeso(double pesorecibido) {
    peso = pesorecibido;
    notifyListeners();
  }

  double getAltura() {
    return altura;
  }

  void setAltura(double alturarecibida) {
    peso = alturarecibida;
    notifyListeners();
  }

  String calcularimc() {
    if (altura == 0 && peso == 0) {
      return "Ingrese los datos";
    }

    if (altura == 0) {
      return 'Ingresa la altura';
    }

    if (peso == 0) {
      return 'Ingresa el peso';
    }
    final double result = peso / ((pow(altura, 2) * 0.0001));
    res = result;
    cambiarxd(res);
    return result.toString();
  }

  void cambiarxd(double res) {
    if (res < 16 && res >= 1) {
      estadoPx = Estados.infrapeso1.name;
    } else if (res >= 16.00 && res <= 16.99) {
      estadoPx = Estados.infrapeso2.name;
    } else if (res >= 17.00 && res <= 18.49) {
      estadoPx = Estados.infrapeso3.name;
    } else if (res >= 18.50 && res <= 24.99) {
      estadoPx = Estados.normal.name;
    } else if (res >= 25.00 && res <= 29.99) {
      estadoPx = Estados.sobrepeso.name;
    } else if (res >= 30.00 && res <= 34.99) {
      estadoPx = Estados.obeso1.name;
    } else if (res >= 35.00 && res <= 40.99) {
      estadoPx = Estados.obeso2.name;
    } else if (res >= 40.0) {
      estadoPx = Estados.obeso3.name;
    }
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
