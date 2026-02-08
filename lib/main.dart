import 'package:flutter/material.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:todo_app/themes/app_theme.dart';
import 'package:todo_app/themes/theme_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeMode,
      builder: (_, mode, _) {
        return MaterialApp(
          title: 'Todo App',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
