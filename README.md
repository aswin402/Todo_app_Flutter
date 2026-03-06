# 📝 Modern Todo App - Flutter & Hive

A sleek, modern, and highly responsive Todo application built with **Flutter**. This project demonstrates best practices in local data persistence using **Hive**, state management with `ValueNotifier`, and a refined UI using **FlexColorScheme** and **VelocityX**.

---

## ✨ Features

- **Local Persistence**: Blazing fast data storage using [Hive](https://pub.dev/packages/hive).
- **Modern UI**: Polished look with Material 3, custom themes, and smooth animations.
- **Dark Mode Support**: Seamlessly switch between Light and Dark modes.
- **Task Management**: Create, Read, Update, and Delete (CRUD) tasks effortlessly.
- **Rich Task Details**: Add titles, notes, and specific dates/times for each task.
- **Animations**: Integrated with `animate_do` and `Lottie` for a premium user experience.

---

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Database**: [Hive](https://pub.dev/packages/hive) & [Hive Flutter](https://pub.dev/packages/hive_flutter)
- **Styling**: [VelocityX](https://pub.dev/packages/velocity_x) & [FlexColorScheme](https://pub.dev/packages/flex_color_scheme)
- **Icons**: Material Design & [Cupertino Icons](https://pub.dev/packages/cupertino_icons)
- **Utilities**: [Intl](https://pub.dev/packages/intl), [Uuid](https://pub.dev/packages/uuid), [Logger](https://pub.dev/packages/logger)
- **Animations**: [Animate Do](https://pub.dev/packages/animate_do), [Lottie](https://pub.dev/packages/lottie)

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version recommended)
- Android Studio / VS Code with Flutter extension

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/Todo_app_Flutter.git
   cd Todo_app_Flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

---

## 📖 Documentation

For detailed information on specific modules, refer to the following guides:

- 🗄️ [Hive Local Database Setup](./HIVE_SETUP.md)
- 🎨 [Theming with FlexColorScheme](./THEMES.md)
- ⚡ [Rapid UI with VelocityX](./VELOCITYX.md)

---

## 📸 Project Structure

```text
lib/
├── data/           # Data persistence layer (Hive)
├── models/         # Data models and adapters
├── pages/          # UI Screens (Home, Task View)
├── themes/         # Theme configurations
├── utils/          # Helper utilities (Logger)
└── widgets/        # Reusable UI components
```

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
