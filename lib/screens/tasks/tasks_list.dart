import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/constants/my_colors.dart';
import 'package:todo/core/ui_helpers/custom_calendar.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/provider/list_provider.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:todo/utils/firebase_utils.dart';

class TasksListScreen extends StatefulWidget {
  const TasksListScreen({super.key});

  @override
  State<TasksListScreen> createState() => _TasksListScreenState();
}

DateTime? selectDate;

class _TasksListScreenState extends State<TasksListScreen> {
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    if (listProvider.tasksList.isEmpty) {
      listProvider.getAllTaskFromFireStore();
    }
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
                child: Text(
                  'To Do List',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              CustomCalendar(
                selectDate: listProvider.selectedDate,
                onDateChange: (date) {
                  listProvider.changeSelectedDate(date);
                },
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return TaskItemWidget(task: listProvider.tasksList[index]);
          },
          padding: EdgeInsets.zero,
          itemCount: listProvider.tasksList.length,
        ))
      ],
    );
  }
}
