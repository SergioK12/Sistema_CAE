
import 'package:flutter/material.dart';

class TaskFormProvider extends ChangeNotifier {
  TaskFormProvider();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? descripcion = '';

  bool isValidForm() {
    return formkey.currentState!.validate() ? true : false;
  }



  String get getdescripcion => descripcion!;

  void setdescription(String desk) {
    descripcion = desk;
  }
}
