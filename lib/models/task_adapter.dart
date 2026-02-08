import 'package:hive/hive.dart';
import 'task.dart';

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    return Task(
      id: reader.read() as String,
      title: reader.read() as String,
      note: reader.read() as String,
      createdAtTime: reader.read() as DateTime,
      createdAtDate: reader.read() as DateTime,
      isCompleted: reader.read() as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..write(obj.id)
      ..write(obj.title)
      ..write(obj.note)
      ..write(obj.createdAtTime)
      ..write(obj.createdAtDate)
      ..write(obj.isCompleted);
  }
}
