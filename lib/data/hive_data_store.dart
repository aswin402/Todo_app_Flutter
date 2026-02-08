import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/task.dart';

class HiveDataStore {
  static const String boxName = 'tasksBox';

  late Box<Task> _box;

  Future<void> init() async {
    _box = Hive.box<Task>(boxName);
  }

  List<Task> getAllTasks() {
    return _box.values.toList();
  }

  Future<void> addTask(Task task) async {
    await _box.put(task.id, task);
  }

  Future<void> updateTask(Task task) async {
    await task.save();
  }

  Future<void> deleteTask(Task task) async {
    await task.delete();
  }

  Future<void> clearAll() async {
    await _box.clear();
  }

  ValueListenable<Box<Task>> listenable() {
    return _box.listenable();
  }
}
