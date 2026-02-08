import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class Task extends HiveObject {
  Task({
    required this.id,
    required this.title,
    required this.note,
    required this.createdAtTime,
    required this.createdAtDate,
    required this.isCompleted,
  });

  final String id;
  String title;
  String note;
  DateTime createdAtTime;
  DateTime createdAtDate;
  bool isCompleted;

  factory Task.create({
    required String title,
    String note = '',
  }) {
    return Task(
      id: const Uuid().v4(),
      title: title,
      note: note,
      createdAtTime: DateTime.now(),
      createdAtDate: DateTime.now(),
      isCompleted: false,
    );
  }
}
