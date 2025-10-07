import 'package:fifth/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
class Theming {
  static ThemeData lightTheme = ThemeData(
    cardColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:MainColors.secondryLightColor,shape: CircleBorder(side: BorderSide(color: Colors.white,width: 4)) ),
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
    iconTheme: IconThemeData(color: MainColors.whited),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: MainColors.primaryLightColor,
        onPrimary: Colors.white,
        secondary: MainColors.secondryLightColor,
        onSecondary: MainColors.secondryLightColor,
        error: MainColors.lightbottomnav,
        onError: MainColors.primaryLightColor,
        background: MainColors.primaryLightColor,
        onBackground: MainColors.secondryLightColor,
        surface: MainColors.primaryLightColor,
        onSurface: Colors.white,
        onErrorContainer: Color(0xA9A9A99C)
    ),
    textTheme: TextStyles.lightTextTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: MainColors.secondryLightColor,
      unselectedItemColor:Color(0xffc8c9cb),
      selectedIconTheme: IconThemeData(size: 25,color:  MainColors.secondryLightColor),
      unselectedIconTheme: IconThemeData(size: 22,color:  Color(0xffc8c9cb)),
      selectedLabelStyle: GoogleFonts.elMessiri(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: MainColors.primaryLightColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: MainColors.whited, size: 35),
      titleTextStyle: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w700,color:MainColors.whited),
      color:MainColors.secondryLightColor,
      elevation: 0.0,
      centerTitle: true,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: MainColors.green, // Set your desired color here
    ),
  );
  static ThemeData darkTheme = ThemeData(
    cardColor: MainColors.darkbottomnav,
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:MainColors.secondryLightColor ,shape: CircleBorder(side: BorderSide(width: 4,color: MainColors.darkbottomnav))),
    bottomAppBarTheme: BottomAppBarTheme(color: MainColors.darkbottomnav),
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: MainColors.secondrydarkColor,
        onPrimary: MainColors.primarydarkColor,
        secondary: MainColors.primarydarkColor,
        onSecondary: MainColors.secondrydarkColor,
        error: MainColors.darkbottomnav,
        onError: MainColors.primarydarkColor,
        background: MainColors.secondrydarkColor,
        onBackground: Colors.white,
        surface: MainColors.secondrydarkColor,
        onSurface: MainColors.secondrydarkColor,
        onErrorContainer:Color(0xCDCACAE8)
    ),
    textTheme: TextStyles.darkTextTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor:  MainColors.secondryLightColor,
      unselectedItemColor: Color(0xffc8c9cb),
      selectedIconTheme: IconThemeData(size: 25),
      unselectedIconTheme: IconThemeData(size: 22),
      selectedLabelStyle: GoogleFonts.elMessiri(fontSize: 15, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: MainColors.primarydarkColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: MainColors.primarydarkColor, size: 35),
      titleTextStyle: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w700,color:MainColors.primarydarkColor),
      color: MainColors.secondryLightColor,
      elevation: 0.0,
      centerTitle: true,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: MainColors.green, // Set your desired color here
    ),

  );
}