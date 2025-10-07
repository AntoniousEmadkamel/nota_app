import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:fifth/base.dart';
import 'package:fifth/providers/app_provider.dart';
import 'package:fifth/screens/tasks_tab_MVVM/tasks_tab_connector.dart';
import 'package:fifth/screens/tasks_tab_MVVM/tasks_tab_view_model.dart';
import 'package:fifth/screens/tasks_tab_MVVM/view/task_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/styles/colors.dart';
import '../task_model.dart';

class TasksViewTab extends StatefulWidget {
  const TasksViewTab({super.key});

  @override
  State<TasksViewTab> createState() => _TasksViewTabState();
}

class _TasksViewTabState extends BaseView<TasksViewTab , TasksTabViewModel>  implements TasksTabConnector{

  @override
  TasksTabViewModel initMyViewModel() {
    return TasksTabViewModel();
  }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
          Container(
            padding: EdgeInsets.only(top: 52,left: 31,right: 31),
            width:double.infinity,
            height: 157,
            color: Theme.of(context).colorScheme.onSecondary,
            child: Text("ToDo List ${ Provider.of<TasksTabViewModel>(context).user?.UserName??""} ",style: Theme.of(context).textTheme.bodyLarge),
          ),
          Positioned(
            top: 75,
            child: SizedBox(
              width: MediaQuery.of(context).size.width*1,
              height: MediaQuery.of(context).size.height*0.15,
              child: CalendarTimeline(
                key: ValueKey('calendar_timeline'), // Add key to preserve state
                initialDate:viewModel.selectedDate, // Use selectedDate instead of DateTime.now()
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) {
                  print("###########beforChange:${viewModel.selectedDate}########");
                  viewModel.changeSelectedDate(date); // Update selectedDate
                  setState(() {});
                  print("###########afterChange:${viewModel.selectedDate}########");

                },
                monthColor: MainColors.whited,
                dayColor: provider.isDark == true
                    ? MainColors.whited
                    : Colors.black,
                dayNameColor: Colors.blue.withOpacity(.5),
                activeDayColor: Colors.blue.withOpacity(.5),
                activeBackgroundDayColor: Theme.of(context).colorScheme.error,
                leftMargin: 20,
                selectableDayPredicate: (date) => true,
                dotColor: Colors.transparent,
                locale: provider.languageCode,
              ),
            ),
          )
        ],
        ),
          StreamBuilder(
            stream: viewModel.getTasksStream(),
            builder:  (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasError) {
                return AlertDialog(content: Text("some thing went wrong"),title: Text("Error"),  actions: [ElevatedButton(onPressed: (){}, child: Text("ok"))],);
              }
              List<TaskModel> tasks= snapshot.data?.docs.map((e) =>e.data()).toList()??[];
              return Expanded(child: ListView.builder(itemBuilder:(context, index) =>TaskItem(task: tasks[index]) ,itemCount:tasks.length,));
            },
              )
      ],),
    );
  }


}