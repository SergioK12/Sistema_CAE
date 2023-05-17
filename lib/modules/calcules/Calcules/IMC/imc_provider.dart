import 'package:flutter/material.dart';

class IMCProvider extends ChangeNotifier {
  var peso = "0.0";
  var altura = "0.0";

  String getpeso() {
    return peso.toString();
  }

  void setpeso(String pesorecibido) {
    peso = pesorecibido;
    notifyListeners();
  }

  String getAltura() {
    return altura;
  }

  void setAltura(String alturarecibida) {
    peso = alturarecibida;
    notifyListeners();
  }
}
