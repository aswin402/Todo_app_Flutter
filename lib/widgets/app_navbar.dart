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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: context.canvasColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onMenuTap,
                icon: const Icon(Icons.menu_rounded, size: 28),
              ),
              title.text.xl2.bold.make(),
              IconButton(
                onPressed: onThemeToggle,
                icon: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  size: 24,
                ),
              ).box.roundedFull.color(context.cardColor).make(),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
