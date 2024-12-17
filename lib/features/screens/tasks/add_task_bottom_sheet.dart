import 'package:flutter/material.dart';
import 'package:todo/core/ui_helpers/text_form_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

final _formKey = GlobalKey<FormState>();
var selectedDate = DateTime.now();
String title = "";
String description = "";

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
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
                  if (_formKey.currentState?.validate() == true) {}
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
}
