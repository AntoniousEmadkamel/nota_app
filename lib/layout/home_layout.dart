import 'package:fifth/screens/settings_tab/settings_tab.dart';
import 'package:fifth/screens/tasks_tab_MVVM/view/tasks_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../screens/tasks_tab_MVVM/view/add_task_bottom_sheet.dart';
import '../shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});
  static const String routeName = "HomeLayout";
  List<Widget> tabs=[TasksViewTab(),SettingsTab()];
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Scaffold(
      extendBody: true,
      body: tabs[provider.index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(backgroundColor:MainColors.secondryLightColor,
        onPressed: () async{
        showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.error,
        isScrollControlled: true,
        context: context,
        builder: (context) {return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBottomSheet(),
          );},
        );
        },child: Icon(CupertinoIcons.add,color: Colors.white,),),
      bottomNavigationBar: BottomAppBar(
        height: 86,
        elevation: 0,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: provider.index,
            elevation: 0,
            onTap: (newTabIndex) {
              provider.changeTabIndex(newTabIndex);
            },
            items:[
          BottomNavigationBarItem(label: "",icon:Icon(CupertinoIcons.list_bullet)),
          BottomNavigationBarItem(label: "",icon:Icon(CupertinoIcons.settings)),
        ]),
      ),
    );
  }
}