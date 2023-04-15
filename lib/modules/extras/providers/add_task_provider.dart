import 'package:flutter/material.dart';

class TaskFormProvider extends ChangeNotifier {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? descripcion = '';

  bool isValidForm() {
    return formkey.currentState!.validate() ? true : false;
  }

  String get getdescripcion => descripcion!;

  String set setdescription (String desk)
}
