import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/task_model.dart';
import '../utils/firebase_utils.dart';

class ListProvider extends ChangeNotifier {
DateTime selectedDate = DateTime.now();
  List<Task> tasksList = [];
  void getAllTaskFromFireStore() async {
    QuerySnapshot<Task> querySnapshot =
    await FirebaseUtils.getTaskCollection().get();
    tasksList = querySnapshot.docs.map(
          (doc) {
        return doc.data();
      },
    ).toList();
    notifyListeners();
  }

  void changeSelectedDate(DateTime newSelectedDate){
    selectedDate = newSelectedDate ;
    notifyListeners();

  }

}