import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class Task {
  Task(
      {required this.description, required this.completed, required this.date});

  @HiveField(0)
  String description;

  @HiveField(1)
  bool completed;

  @HiveField(2)
  String date;

  @override
  String toString() {
    return '$description: $completed';
  }
}
