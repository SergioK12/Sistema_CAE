import 'package:cae/modules/extras/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskFormProvider extends ChangeNotifier {
  TaskFormProvider();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? descripcion = '';
  bool? isFinished = false;

  bool isValidForm() {
    return formkey.currentState!.validate() ? true : false;
  }

  String get getdescripcion => descripcion!;

  void setdescription(String desk) {
    descripcion = desk;
  }

  Future<int> guardarTask(Task task) async {
    final Box<Task> box = await Hive.openBox<Task>('Tareas');
    return box.add(task);
  }

  Future<List<Task>> getListTAsk() async {
    List<Task> lista = [];
    final Box<Task> box = await Hive.openBox<Task>('Tareas');
    lista = box.values.toList();
    return lista;
  }

  Future<bool> createCookiesBox(var task) async {
    final Box<Task> box = await Hive.openBox<Task>('Tareas');
    await box.add(task as Task);
    return true;
  }

  Future<void> borrarTask(int index) async {
    final Box<Task> box = await Hive.openBox<Task>('Tareas');
    return box.deleteAt(index);
  }
}
