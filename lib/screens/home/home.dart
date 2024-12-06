import 'package:flutter/material.dart';
import 'package:todo/core/thems/theme.dart';
import 'package:todo/screens/setting/setting.dart';
import 'package:todo/screens/tasks/tasks_list.dart';

import '../tasks/add_task_bottom_sheet.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int selectIndex = 0;
//final List<Widget> screens = [Setting(), TasksListScreen()];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'To Do List',
            style: MyTheme.lightTheme.textTheme.titleLarge,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(color: Colors.white, width: 3),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              showCustomBottomSheet(context);
            }),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            enableFeedback: false,
            currentIndex: selectIndex,
            onTap: (index) {
              setState(() {
                selectIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    size: 31,
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 31,
                  ),
                  label: ""),
            ],
          ),
        ),
        body: selectIndex == 0 ? TasksListScreen() : Setting(),
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => AddTaskBottomSheet(),
    );
  }
}
