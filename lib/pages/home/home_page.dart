import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_logger.dart';
import 'package:todo_app/widgets/app_navbar.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../themes/theme_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Scaffold(
      body: VStack([
             AppNavbar(
               title: "Todo App",
               isDark: isDark,
               onThemeToggle: ThemeController.toggleTheme,
               onMenuTap: () {
                 AppLogger.i("Menu tapped");
               },
             ),
     
             Expanded(
               child: "Hello World 👋"
                   .text
                   .xl2
                   .bold
                   .makeCentered(),
             ),
           ]),
    );
  }
}
