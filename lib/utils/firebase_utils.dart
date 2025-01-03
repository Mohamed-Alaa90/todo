import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/task_model.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(
          fromFirestore: (snapshot, options) => Task.fromFireStor(
            snapshot.data()!,
          ),
          toFirestore: (task, options) => task.toFirestore(),
        );
  }

  static Future<void> addTaskToFireStore(Task task) {
    var taskCollection = getTaskCollection();
    var taskDocRef = taskCollection.doc();
    task.id = taskDocRef.id;
    return taskDocRef.set(task);
  }
}
