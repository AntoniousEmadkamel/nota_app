class TaskModel{
String id;
String title;
int date;
String description;
bool isDone;
String userId;

TaskModel({this.id="",required this.title,required this.date ,required this.description, this.isDone=false,
  required this.userId
});

TaskModel.convertFromMapToJson(Map<String,dynamic> taskFirebaseMap ):this(
 id: taskFirebaseMap["id"],
 title: taskFirebaseMap["title"],
date:taskFirebaseMap["date"] ,
description: taskFirebaseMap["description"],
isDone: taskFirebaseMap["isDone"],
userId: taskFirebaseMap["userId"]
);

Map<String,dynamic> convertFromJsonToMap(){
  return {
    "id":id,
    "title":title,
    "date":date,
    "description":description,
    "isDone":isDone,
    "userId":userId
  };
}

Map<String,dynamic> updateTaskToBeDone(){
  return {
    "id":id,
    "title":title,
    "date":date,
    "description":description,
    "isDone":true,
    "userId":userId
  };
}

}