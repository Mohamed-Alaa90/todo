import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/ui_helpers/text_form_field.dart';
import 'package:todo/model/task_model.dart';
import 'package:todo/provider/list_provider.dart';
import 'package:todo/utils/firebase_utils.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

final _formKey = GlobalKey<FormState>();

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  String title = "";
  String description = "";
  late ListProvider listProvider;

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  title = value;
                },
                validator: (value) {
                  return value?.isEmpty == true ? "enter name" : null;
                },
                style: Theme.of(context).textTheme.titleSmall,
                labelText: "Task Name",
                hintText: "Enter Task Name",
                prefixIcon: Icons.task,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  description = value;
                },
                validator: (value) {
                  return value?.isEmpty == true ? "Enter Description" : null;
                },
                hintText: "Enter Description",
                maxLines: 5,
                style: Theme.of(context).textTheme.titleSmall,
                labelText: "Description",
                prefixIcon: Icons.description,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Select Time",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 3,
              ),
              TextButton(
                onPressed: () {
                  showCalender();
                },
                child: Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              ElevatedButton(
                onPressed: () {
                  addTask();
                },
                child: const Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showCalender() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask() async {
    if (_formKey.currentState?.validate() == true) {
      Task task =
          Task(title: title, description: description, dateTime: selectedDate);

      try {
        await FirebaseUtils.addTaskToFireStore(task).timeout(
          const Duration(milliseconds: 500),
          onTimeout: () async {
            listProvider.getAllTaskFromFireStore();
            Navigator.pop(context);
            showSuccessSnackbar();
          },
        );
      } catch (e) {
        showErrorSnackbar(e.toString());
      }
    }
  }

  void showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Task added successfully!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showErrorSnackbar(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $error'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
