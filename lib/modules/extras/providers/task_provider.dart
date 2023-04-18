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

  void guardarTask(Task task) async {
    final Box<Task> box = await Hive.openBox<Task>('Tareas');
    await box.put(task.id, task);
  }

  Future<List<Task>> getListTAsk() async {
    List<Task> lista = [];
    final Box<Task> box = await Hive.openBox<Task>('Tareas');
    lista = box.values.toList();
    return lista;
  }

  Future<void> borrarTask(String id) async {
    final Box<Task> box = await Hive.openBox<Task>('Tareas');
    notifyListeners();
    return box.delete(id);
  }

  Future<void> alternarBoleano(String id, bool estadoactual) async {
    final Box<Task> box = await Hive.openBox<Task>('Tareas');
    final Task? latask = box.get(id);
    latask!.completed = !estadoactual;
    await box.put(latask.id, latask);

  }
}
