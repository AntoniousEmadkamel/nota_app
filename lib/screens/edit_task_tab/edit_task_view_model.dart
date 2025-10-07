import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifth/base.dart';
import 'package:fifth/screens/edit_task_tab/edit_task_connector.dart';

import '../tasks_tab_MVVM/task_model.dart';

class EditTaskViewModel extends BaseViewModel<EditTaskConnector>{

   void updateTask(TaskModel task) {
    var collectionReference= getTasksCollection();
    collectionReference.doc(task.id).update(task.convertFromJsonToMap());
  }

   CollectionReference<TaskModel> getTasksCollection(){
    return FirebaseFirestore.instance.collection("tasks") .withConverter<TaskModel>(fromFirestore: (snapshot, options) => TaskModel.convertFromMapToJson(snapshot.data()!), toFirestore: (value, options) => value.convertFromJsonToMap());
  }

}