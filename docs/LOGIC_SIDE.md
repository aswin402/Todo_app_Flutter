# 📦 Local Data Layer (Hive)

This folder contains the **local persistence logic** of the app using **Hive**.
It follows a clear separation of concerns similar to a modern backend architecture
(Prisma schema → serializer → data access layer).

---

## 📁 Folder Structure

```

lib/
├── data/
│   └── hive_data_store.dart
└── models/
├── task.dart
└── task_adapter.dart

````

---

## 🧱 `models/task.dart` — Data Model (Schema)

This file defines the **Task data structure** used throughout the app.

### Responsibility
- Describes the **shape of a Task**
- Contains **only fields**
- No database or business logic

### Role (Web analogy)
- Equivalent to a **Prisma model schema**

```prisma
model Task {
  id          String
  title       String
  note        String
  isCompleted Boolean
}
````

### Why it exists

* Acts as a **single source of truth** for task data
* Used by UI, services, and database layer

---

## 🔌 `models/task_adapter.dart` — Hive Type Adapter (Serializer)

This file handles **serialization and deserialization** of `Task` objects
to and from Hive’s binary storage format.

### Responsibility

* Converts `Task` → binary (write)
* Converts binary → `Task` (read)
* Defines how data is stored on disk

### Role (Web analogy)

* Similar to **Zod schema + serializer**
* Ensures correct data structure at runtime

### Important Notes

* Field **order must never change**
* New fields must be added at the end
* `typeId` uniquely identifies this model in Hive

---

## 🗄 `data/hive_data_store.dart` — Data Access Layer (CRUD)

This file is the **single entry point** for all Task-related database operations.

### Responsibility

* Initialize Hive box
* Perform CRUD operations
* Expose reactive listeners to the UI

### Available Operations

* Create task
* Read all tasks
* Update task
* Delete task
* Clear database

### Role (Web analogy)

* Equivalent to **Prisma Client / Repository layer**
* UI never talks to Hive directly

---

## 🔄 Architecture Flow

```
UI
 ↓
HiveDataStore (CRUD)
 ↓
Hive Box
 ↓
TaskAdapter (serialization)
 ↓
Task Model
```

---

## ✅ Why this structure

* Clean separation of concerns
* Easy to maintain and extend
* Database logic isolated from UI
* Scales well for larger apps

This setup mirrors modern backend patterns while remaining lightweight
for Flutter applications.

---

## 🧠 Summary

| File                   | Purpose                         |
| ---------------------- | ------------------------------- |
| `task.dart`            | Defines data structure (schema) |
| `task_adapter.dart`    | Handles binary serialization    |
| `hive_data_store.dart` | Handles database logic (CRUD)   |

---


