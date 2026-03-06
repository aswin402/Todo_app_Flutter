# 🚀 Flutter Todo App – Initial Setup

This document explains the **initial development setup** completed for the Flutter Todo App, focusing on **App Theming** and **Logging**.

---

## 🎨 App Theme Setup

The app uses the **flex_color_scheme** package to provide a modern, scalable, and Material 3–ready theme system.

### 📁 File Structure

```
lib/
├── themes/
│   └── app_theme.dart
└── main.dart
```

### 🧩 Theme Implementation

We defined both **Light** and **Dark** themes using `FlexThemeData`.

**Key features:**

* Material 3 support
* Consistent component theming
* Cupertino widgets follow Material theme
* Easy future customization

### 📄 `themes/app_theme.dart`

* Uses `FlexScheme.shadStone`
* Configures sub-themes (inputs, navigation, effects)
* Enables platform-comfortable visual density

### 🔌 Applying Theme in `main.dart`

```dart
MaterialApp(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  themeMode: ThemeMode.system,
)
```

This allows the app to automatically switch between light and dark modes based on the system setting.

---

## 🪵 Logger Setup

Logging is handled using the **logger** package, providing structured, colorful, and readable logs during development.

### 📁 File Structure

```
lib/
├── utils/
│   └── app_logger.dart
```

### 📄 `utils/app_logger.dart`

A centralized logger instance is created using `PrettyPrinter` for clean output.

**Features:**

* Colored logs
* Emoji support
* Timestamps
* Multiple log levels (debug, info, warning, error)

### 🧩 Usage Example

```dart
import 'utils/app_logger.dart';

AppLogger.log.i("App started");
AppLogger.log.e("Something went wrong");
```

### 🧠 Log Levels

| Level | Usage             |
| ----- | ----------------- |
| `d()` | Debug information |
| `i()` | General info      |
| `w()` | Warnings          |
| `e()` | Errors            |
| `f()` | Fatal issues      |

---

## ✅ Current Setup Summary

✔ Material 3–ready app theme (light & dark)
✔ Centralized theme management
✔ Centralized logging utility
✔ Clean and scalable folder structure

This setup provides a **strong foundation** for building features like Todo models, Hive storage, and UI screens.

---

## 🔜 Next Steps

* Create Todo data model (UUID-based)
* Setup Hive local database
* Build Todo UI screens

Happy coding! 🚀
