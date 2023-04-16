
import 'package:cae/modules/extras/models/task_model.dart';
import 'package:cae/modules/extras/services/hive_service.dart';
import 'package:flutter/material.dart';

class TaskFormProvider extends ChangeNotifier {
  TaskFormProvider();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? descripcion = '';
  List<Task> lalista = [];

  bool isValidForm() {
    return formkey.currentState!.validate() ? true : false;
  }

  String get getdescripcion => descripcion!;

  void setdescription(String desk) {
    descripcion = desk;
  }

  void actualizarlista() {
    lalista = HiveDB().lalista;
    notifyListeners();
  }
}
