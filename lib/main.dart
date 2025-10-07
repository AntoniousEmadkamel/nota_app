import 'package:fifth/layout/home_layout.dart';
import 'package:fifth/providers/app_provider.dart';
import 'package:fifth/screens/Login_MVVM/login_view_model.dart';
import 'package:fifth/screens/Signup_MVVM/Signup_ViewModel.dart';
import 'package:fifth/screens/auth_layout/auth_layout.dart';
import 'package:fifth/screens/edit_task_tab/edit_task_view_model.dart';
import 'package:fifth/screens/edit_task_tab/view/edit_task_tab.dart';
import 'package:fifth/screens/tasks_tab_MVVM/tasks_tab_view_model.dart';
import 'package:fifth/shared/styles/theming.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppProvider(),),
    ChangeNotifierProvider(create: (context) => LoginViewModel(),),
    ChangeNotifierProvider(create: (context) => SignupViewModel(),),
    ChangeNotifierProvider(create: (context) => TasksTabViewModel(),),
    ChangeNotifierProvider(create: (context) => EditTaskViewModel(),),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    var TasksProvider=Provider.of<TasksTabViewModel>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      debugShowCheckedModeBanner: false,
      routes: {
        HomeLayout.routeName:(context)=>HomeLayout(),
        AuthLayout.routeName: (context)=>AuthLayout(),
        EditTaskScreen.routeName:(context)=>EditTaskScreen(),
      },
      initialRoute:TasksProvider.fireBaseUser!=null?HomeLayout.routeName :AuthLayout.routeName,
      theme: Theming.lightTheme,
      darkTheme: Theming.darkTheme,
      themeMode:provider.isDark?ThemeMode.dark:ThemeMode.light,
      locale:provider.english? Locale("en"):Locale("ar"),
    );
  }
}