import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fifth/base.dart';
import 'package:fifth/screens/Signup_MVVM/Signup_connector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Login_MVVM/user_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupViewModel extends BaseViewModel<SignupConnector>{

  Future<void>createUserForSignup(String name,int age,String email,String password,BuildContext context)async{
    try {
      connector!.showLoading();
      final newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if(newUser.user?.uid !=null){
        UserModel userModel=UserModel(id: newUser.user!.uid, UserName: name, age:age.toString(), email: email);
        addUserToFirestor(userModel).then((value) async{
          await newUser.user!.sendEmailVerification();
          connector!.hideLoading();
          connector!.showMessage(AppLocalizations.of(context)!.successfullycreatedaccount);
          connector!.goToLogin();
        },);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        connector!.hideLoading();
        connector!.showMessage(AppLocalizations.of(context)!.thepasswordprovidedistooweak);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        connector!.hideLoading();
        connector!.showMessage(AppLocalizations.of(context)!.theaccountalreadyexistsforthatemail);
        print('The account already exists for that email.');
      }
    }catch(e){
      connector!.hideLoading();
      connector!.showMessage(e.toString());
    }
  }

  Future<void> addUserToFirestor(UserModel user)async{
    var userCollectionReference= getUsersCollection();
    var documentReference=userCollectionReference.doc(user.id);
    documentReference.set(user);
  }

   CollectionReference<UserModel> getUsersCollection(){
    return FirebaseFirestore.instance.collection("users") .withConverter<UserModel>(fromFirestore: (snapshot, options) => UserModel.convertFromMapToJson(snapshot.data()!), toFirestore: (value, options) => value.convertFormJsonToMap());
  }

}