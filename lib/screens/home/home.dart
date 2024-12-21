import 'package:flutter/material.dart';

import '../setting/setting.dart';
import '../tasks/add_task_bottom_sheet.dart';
import '../tasks/tasks_list.dart';

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
    return Scaffold(
      //extendBody: true,
      // appBar: AppBar(
      //   title: Text(
      //     'To Do List',
      //     style: MyTheme.lightTheme.textTheme.titleLarge,
      //   ),
      // ),
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
            showCustomBottomSheet();
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
      body: selectIndex == 0 ? const TasksListScreen() : const Setting(),
    );
  }

  void showCustomBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
        ),
        child: const AddTaskBottomSheet(),
      ),
    );
  }
}
