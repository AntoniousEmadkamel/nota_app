import 'package:fifth/base.dart';
import 'package:fifth/screens/Login_MVVM/login_connector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginViewModel extends BaseViewModel<LoginConnector>{

   Future<void> Login(String email,String password,BuildContext context)async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      connector!.showLoading();

      if(credential.user?.uid !=null){
        if(credential.user!.emailVerified){
          connector!.hideLoading();
          connector!.goToHome();
        }
        else{
          connector!.hideLoading();
          connector!.showMessage(AppLocalizations.of(context)!.verifyemail);
        }
      }
    } on FirebaseAuthException catch (e) {
      connector!.hideLoading();
      connector!.showMessage(AppLocalizations.of(context)!.wrongemailorpassword);
    }
  }

}