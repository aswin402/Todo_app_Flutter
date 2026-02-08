import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppNavbar extends StatelessWidget {
  final String title;
  final VoidCallback onMenuTap;
  final VoidCallback onThemeToggle;
  final bool isDark;

  const AppNavbar({
    super.key,
    required this.title,
    required this.onMenuTap,
    required this.onThemeToggle,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return VStack([
      HStack([
        
        /// MENU BUTTON
        Icon(Icons.menu)
            .p8()
            .onTap(onMenuTap),
            
            
        /// TITLE
        HStack([
          title.text.xl.bold.center.make(),
        ]).expand(),
        /// THEME TOGGLE
        Icon(
          isDark ? Icons.dark_mode : Icons.light_mode,
          size: 20,
        )
            .p8()
            .box
            .roundedLg
            .color(context.cardColor)
            .make()
            .onTap(onThemeToggle),

        8.widthBox,

      ])
          .p16()
          .box
          .height(160)
          .roundedLg
          .border()
          .color(context.canvasColor)
          .make()
          .pOnly(top: 32, left: 16, right: 16),
    ]);
  }
}
