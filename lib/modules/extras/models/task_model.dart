import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class Task {
  Task(
      {required this.description, required this.completed, required this.date, required this.id});

   @HiveField(0)
  String id;

  @HiveField(1)
  String description;

  @HiveField(2)
  bool completed;

  @HiveField(3)
  String date;

  @override
  String toString() {
    return '$description: $completed';
  }
}
