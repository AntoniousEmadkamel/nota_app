import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier{
  String languageCode="en";
  bool english=true;
  bool isDark=true;
  int index=0;


  changeLanguage(bool englishLMode){
    if (englishLMode){english=true;languageCode ="en";}
    else{english=false;languageCode="ar";}
    notifyListeners();
  }
  changeMode(darkFlag){
  if(darkFlag==true){isDark=true;}
  else{isDark=false;}
  notifyListeners();
  }
  changeTabIndex(value){
   index=value;
   notifyListeners();
  }



}