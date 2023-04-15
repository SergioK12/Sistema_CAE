import 'package:cae/modules/extras/models/task_model.dart';
import 'package:hive/hive.dart';

class HiveDB {

  Future<int> guardarTask(Task task) async {
    final Box<Task> box = await Hive.openBox<Task>('Tareas');
    return box.add(task);
  }

  Future<List<Task>>  getListTAsk ()async {
    List<Task> lista = [];
    final Box<Task> box = await Hive.openBox<Task>('Tareas');
    lista = box.values.toList();
    return lista;
  }

  Future<bool> createCookiesBox(var task) async {
    final Box<Task> box = await Hive.openBox<Task>('Tareas');    
    await box.add(task as Task); //Se pasa un iterable que contiene n variables a almacenar
    return true;
  }
}