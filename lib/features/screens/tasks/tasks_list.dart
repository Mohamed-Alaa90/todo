import 'package:flutter/material.dart';
import 'package:todo/core/constants/my_colors.dart';
import 'package:todo/core/ui_helpers/customCalendar.dart';
import 'package:todo/core/ui_helpers/taskItemWidget.dart';

class TasksListScreen extends StatefulWidget {
  const TasksListScreen({super.key});

  @override
  State<TasksListScreen> createState() => _TasksListScreenState();
}

DateTime? selectDate;

class _TasksListScreenState extends State<TasksListScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Stack(
            alignment: const Alignment(0, 2.0),
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                color: MyColor.primerColor,
                height: mediaQuery.height * 0.22,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
                child: Text(
                  'To Do List',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              CustomCalendar(
                selectDate: selectDate,
                onDateChange: (p0) {
                  setState(() {
                    selectDate = p0;
                  });
                },
              ),
            ],
          ),
        ),

        Expanded(child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            TaskItemWidget(),
            TaskItemWidget(),
            TaskItemWidget(),
            TaskItemWidget(),
            TaskItemWidget(),
          ],
        ))
      ],
    );
  }
}
