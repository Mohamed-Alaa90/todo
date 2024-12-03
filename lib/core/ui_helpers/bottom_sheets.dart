import 'package:flutter/material.dart';
import 'package:todo/core/constants/my_colors.dart';
import 'package:todo/core/ui_helpers/text_form_field.dart';

void showCustomBottomSheet(BuildContext context) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  showModalBottomSheet(

    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    builder: (context) {
      return Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Task',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: MyColor.blackColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Name";
                        }
                        return null;
                      },
                      style: const TextStyle(color: MyColor.blackColor),
                      prefixIcon: Icons.add_card,
                      controller: titleController,
                      hintText: "Name Task"),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Description";
                        }
                        return null;
                      },
                      maxLines: 4,
                      style: const TextStyle(color: MyColor.blackColor),
                      prefixIcon: Icons.description,
                      controller: descriptionController,
                      hintText: " Description Task"),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "7/8/2024",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyColor.blackColor),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      side: const BorderSide(color: Colors.white, width: 3),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final taskName = titleController.text.trim();
                        final taskDescription = descriptionController.text.trim();
          
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
