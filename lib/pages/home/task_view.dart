import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/utils/app_logger.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../data/hive_data_store.dart';

class TaskView extends StatefulWidget {
  final Task? task;
  const TaskView({super.key, this.task});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _noteController.text = widget.task!.note;
      _selectedDate = widget.task!.createdAtDate;
      _selectedTime = widget.task!.createdAtTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    var isEditing = widget.task != null;
    return Scaffold(
      appBar: AppBar(
        title: (isEditing ? "Edit Task" : "New Task").text.bold.make(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: VStack([
        FadeInDown(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: context.cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: VStack([
              "Details".text.xl.bold.make().pOnly(bottom: 20),
              
              // TITLE
              "Title".text.sm.semiBold.gray500.make().pOnly(bottom: 8),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "What needs to be done?",
                  filled: true,
                  fillColor: context.canvasColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ).pOnly(bottom: 20),

              // NOTE
              "Notes".text.sm.semiBold.gray500.make().pOnly(bottom: 8),
              TextField(
                controller: _noteController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Add more description...",
                  filled: true,
                  fillColor: context.canvasColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ]),
          ),
        ),
        
        24.heightBox,

        FadeInUp(
          child: Row(
            children: [
              Expanded(
                child: _buildPickerCard(
                  title: "Date",
                  value: DateFormat.yMMMd().format(_selectedDate),
                  icon: Icons.calendar_month_rounded,
                  onTap: () {
                    DatePicker.showDatePicker(
                      context,
                      initialDateTime: _selectedDate,
                      onConfirm: (date, _) {
                        setState(() => _selectedDate = date);
                      },
                    );
                  },
                ),
              ),
              16.widthBox,
              Expanded(
                child: _buildPickerCard(
                  title: "Time",
                  value: DateFormat.jm().format(_selectedTime),
                  icon: Icons.access_time_rounded,
                  onTap: () {
                    DatePicker.showDatePicker(
                      context,
                      initialDateTime: _selectedTime,
                      pickerMode: DateTimePickerMode.datetime,
                      onConfirm: (time, _) {
                        setState(() => _selectedTime = time);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: ElevatedButton(
            onPressed: _saveTask,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
              backgroundColor: context.primaryColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: (isEditing ? "Update Task" : "Create Task").text.lg.bold.make(),
          ),
        ),
        
        20.heightBox,
      ]).p24(),
    );
  }

  Widget _buildPickerCard({
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title.text.sm.semiBold.gray500.make().pOnly(bottom: 8),
            Row(
              children: [
                Icon(icon, size: 20, color: context.primaryColor),
                10.widthBox,
                value.text.semiBold.make().flexible(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _saveTask() {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a title")),
      );
      return;
    }

    final dataStore = HiveDataStore();
    
    if (widget.task == null) {
      final newTask = Task.create(
        title: _titleController.text,
        note: _noteController.text,
      );
      newTask.createdAtDate = _selectedDate;
      newTask.createdAtTime = _selectedTime;
      dataStore.addTask(newTask);
      AppLogger.i("Task created: ${newTask.title}");
    } else {
      widget.task!.title = _titleController.text;
      widget.task!.note = _noteController.text;
      widget.task!.createdAtDate = _selectedDate;
      widget.task!.createdAtTime = _selectedTime;
      widget.task!.save();
      AppLogger.i("Task updated: ${widget.task!.title}");
    }

    Navigator.pop(context);
  }
}
