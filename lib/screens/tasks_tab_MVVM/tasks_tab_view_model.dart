import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifth/base.dart';
import 'package:fifth/screens/tasks_tab_MVVM/task_model.dart';
import 'package:fifth/screens/tasks_tab_MVVM/tasks_tab_connector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Login_MVVM/user_model.dart';

class TasksTabViewModel extends BaseViewModel<TasksTabConnector>{
  var selectedDate=DateTime.now();
  List <TaskModel> tasksList=[];

  UserModel? user;
  User? fireBaseUser;

  TasksTabViewModel(){
    fireBaseUser = FirebaseAuth.instance.currentUser;
    if(fireBaseUser !=null){
      initUser();
    }
  }
  void initUser() async{
    user=await readUserFromFirestore();
    debugPrint("##############userName:${user?.UserName}###############");
    notifyListeners();
  }

  CollectionReference<UserModel> getUsersCollection(){
    return FirebaseFirestore.instance.collection("users") .withConverter<UserModel>(fromFirestore: (snapshot, options) => UserModel.convertFromMapToJson(snapshot.data()!), toFirestore: (value, options) => value.convertFormJsonToMap());
  }

  Future<UserModel?> readUserFromFirestore() async{
    var userCollectionReference= getUsersCollection();
    DocumentSnapshot<UserModel> documentReference=await userCollectionReference.doc(FirebaseAuth.instance.currentUser?.uid??"").get();
    return documentReference.data();
  }


  changeSelectedDate(DateTime newDate){
    selectedDate=newDate;
    notifyListeners();
  }

   CollectionReference<TaskModel> getTasksCollection(){
    return FirebaseFirestore.instance.collection("tasks") .withConverter<TaskModel>(fromFirestore: (snapshot, options) => TaskModel.convertFromMapToJson(snapshot.data()!), toFirestore: (value, options) => value.convertFromJsonToMap());
  }

   Future<void> addTask(TaskModel task) async{
    var tasksCollectionReference= getTasksCollection();
    var documentReference=tasksCollectionReference.doc();
    task.id=documentReference.id;
    documentReference.set(task);
  }

   void updateTaskTobeDone(TaskModel task) {
    var collectionReference= getTasksCollection();
    collectionReference.doc(task.id).update(task.updateTaskToBeDone());
  }

   Future<List<TaskModel>> getTasks(DateTime dateTime)async{
    try{
      QuerySnapshot<TaskModel> tasks=await getTasksCollection().where("userId",isEqualTo:FirebaseAuth.instance.currentUser!.uid).where("date",isEqualTo:DateUtils.dateOnly(dateTime).millisecondsSinceEpoch).get();
        connector!.showLoading();
      tasksList= tasks.docs.map((e) => e.data(),).toList();
      connector!.hideLoading();
    }catch(e){
      connector!.hideLoading();
      connector!.showMessage(e.toString());
    }
    return tasksList;
  }

   Stream<QuerySnapshot<TaskModel>> getTasksStream() {
    print("fetch tasks of ${selectedDate}");
    return getTasksCollection().where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid).where("date",isEqualTo:DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch).snapshots();
  }

   void deleteTask(String id) {
    var collectionReference= getTasksCollection();
    collectionReference.doc(id).delete();
  }

}