# 🗄️ Hive Local Database Setup

This project uses [Hive](https://pub.dev/packages/hive) as the primary local storage solution. Hive is a lightweight, blazing-fast NoSQL database written in Dart.

## 🚀 Why Hive?

- **Fastest Local DB**: Much faster than SQLite for common operations.
- **No Native Dependencies**: Works out-of-the-box on all platforms.
- **Type-Safe**: Supports strongly typed objects through generated adapters.

## 🛠️ Implementation Details

### 1. Model Definition (`Task`)
We use `HiveObject` to enable easy updates and deletions.
```dart
class Task extends HiveObject {
  final String id;
  String title;
  String note;
  DateTime createdAtTime;
  DateTime createdAtDate;
  bool isCompleted;
  // ...
}
```

### 2. Custom TypeAdapter
Since Hive stores data in binary format, we implemented `TaskAdapter` to handle serialization.
- Registered in `main.dart` using `Hive.registerAdapter(TaskAdapter())`.

### 3. HiveDataStore
A dedicated class handles all database interactions:
- `addTask(Task task)`: Adds a new task to the box.
- `updateTask(Task task)`: Updates existing task details.
- `deleteTask(Task task)`: Removes a task.
- `listenable()`: Returns a `ValueListenable` for real-time UI updates.

## 🔄 Reactive UI
We use `ValueListenableBuilder` in the `HomePage` to automatically rebuild the UI whenever data in the Hive box changes:
```dart
ValueListenableBuilder(
  valueListenable: Hive.box<Task>(boxName).listenable(),
  builder: (context, box, _) {
    // Rebuilds automatically when box changes!
  },
)
```
