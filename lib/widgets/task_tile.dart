import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const TaskTile({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final secondaryColor = context.theme.colorScheme.secondary;
    final primaryColor = context.theme.colorScheme.primary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: task.isCompleted ? context.cardColor.withValues(alpha: 0.6) : context.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onToggle,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: task.isCompleted ? Colors.green : Colors.transparent,
                      border: Border.all(
                        color: task.isCompleted ? Colors.green : Colors.grey.shade400,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: task.isCompleted
                        ? const Icon(Icons.check, size: 18, color: Colors.white)
                        : null,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (task.isCompleted
                              ? task.title.text.lg.bold.lineThrough
                              : task.title.text.lg.bold)
                          .color(task.isCompleted ? secondaryColor : primaryColor)
                          .make(),
                      if (task.note.isNotEmpty)
                        task.note.text.sm
                            .color(secondaryColor)
                            .maxLines(1)
                            .ellipsis
                            .make()
                            .pOnly(top: 2),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.calendar_month_rounded,
                              size: 14, color: secondaryColor.withValues(alpha: 0.7)),
                          const SizedBox(width: 4),
                          DateFormat.yMMMd()
                              .format(task.createdAtDate)
                              .text
                              .xs
                              .color(secondaryColor.withValues(alpha: 0.7))
                              .make(),
                          const SizedBox(width: 12),
                          Icon(Icons.access_time_rounded,
                              size: 14, color: secondaryColor.withValues(alpha: 0.7)),
                          const SizedBox(width: 4),
                          DateFormat.jm()
                              .format(task.createdAtTime)
                              .text
                              .xs
                              .color(secondaryColor.withValues(alpha: 0.7))
                              .make(),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.delete_sweep_outlined, 
                      color: Colors.red.withValues(alpha: 0.7), size: 24),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
