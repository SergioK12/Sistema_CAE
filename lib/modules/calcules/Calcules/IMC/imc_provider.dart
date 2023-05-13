import 'package:flutter/material.dart';

class IMCProvider extends ChangeNotifier {
  var peso = 0.0;
  var altura = 0.0;

  String getpeso() {
    return peso.toString();
  }

  void setpeso(double pesorecibido) {
    peso = pesorecibido;
  }

  double getAltura() {
    return altura;
  }

  void setAltura(double alturarecibida) {
    peso = alturarecibida;
  }
}
