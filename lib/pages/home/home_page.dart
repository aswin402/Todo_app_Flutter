import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/data/hive_data_store.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/pages/home/task_view.dart';
import 'package:todo_app/utils/app_logger.dart';
import 'package:todo_app/widgets/app_navbar.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../themes/theme_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HiveDataStore _dataStore = HiveDataStore();

  @override
  void initState() {
    super.initState();
    _dataStore.init();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Scaffold(
      floatingActionButton: FadeInUp(
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TaskView()),
            );
          },
          label: "Add Task".text.make(),
          icon: const Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: VStack([
          AppNavbar(
            title: "Todo App",
            isDark: isDark,
            onThemeToggle: ThemeController.toggleTheme,
            onMenuTap: () {
              AppLogger.i("Menu tapped");
            },
          ),
          ValueListenableBuilder(
            valueListenable: Hive.box<Task>(HiveDataStore.boxName).listenable(),
            builder: (context, Box<Task> box, _) {
              var tasks = box.values.toList();
              
              // Sort tasks: Incomplete first, then by date
              tasks.sort((a, b) {
                if (a.isCompleted != b.isCompleted) {
                  return a.isCompleted ? 1 : -1;
                }
                return b.createdAtDate.compareTo(a.createdAtDate);
              });

              if (tasks.isEmpty) {
                return VStack([
                  Lottie.asset(
                    'assets/1.json',
                    height: 250,
                  ).centered(),
                  "Everything is done! 🎉".text.xl.gray500.makeCentered(),
                  "No tasks found.".text.sm.gray400.makeCentered().p4(),
                ]).expand();
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return FadeInLeft(
                    delay: Duration(milliseconds: index * 100),
                    child: TaskTile(
                      task: task,
                      onToggle: () {
                        task.isCompleted = !task.isCompleted;
                        task.save();
                      },
                      onDelete: () {
                        task.delete();
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskView(task: task),
                          ),
                        );
                      },
                    ),
                  );
                },
              ).expand();
            },
          ),
        ]),
      ),
    );
  }
}
