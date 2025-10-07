class UserModel{
  String id;
  String UserName;
  String age;
  String email;

  UserModel({required this.id,required this.UserName,required this.age,required this.email});

  UserModel.convertFromMapToJson(Map<String,dynamic> userFirebaseMap):this(
    id:userFirebaseMap["id"] ,
    UserName:userFirebaseMap["UserName"] ,
    age:userFirebaseMap["age"] ,
    email:userFirebaseMap["email"] ,
  );

  Map<String,dynamic> convertFormJsonToMap(){
    return{
      "id":id,
      "UserName":UserName ,
      "age" :age ,
      "email":email ,
    };
  }

}