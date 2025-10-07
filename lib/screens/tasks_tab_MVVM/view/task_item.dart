import 'package:fifth/providers/app_provider.dart';
import 'package:fifth/screens/edit_task_tab/view/edit_task_tab.dart';
import 'package:fifth/screens/tasks_tab_MVVM/task_model.dart';
import 'package:fifth/screens/tasks_tab_MVVM/tasks_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../../shared/styles/colors.dart';
class TaskItem extends StatelessWidget {
  TaskModel task;
   TaskItem({required this.task,super.key});
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<TasksTabViewModel>(context);
    var ApplicationProvider=Provider.of<AppProvider>(context);

    return  Padding(
      padding: const EdgeInsets.symmetric(vertical:44,horizontal:30 ),
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.23,
            // A motion is a widget used to control how the pane animates.
            motion: const DrawerMotion(),
            // All actions are defined in the children parameter.
            children:  [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                borderRadius:BorderRadius.only(topLeft:Radius.circular(14),bottomLeft: Radius.circular(14) ) ,
                onPressed: (context) {
                  provider.deleteTask(task.id);
                  // FirebaseFunctions.deleteTask(widget.task!);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: AppLocalizations.of(context)!.delete,
              ),
            ],
          ),
          endActionPane: ActionPane(
              extentRatio: 0.23,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  borderRadius:BorderRadius.only(topRight:Radius.circular(14),bottomRight: Radius.circular(14) ) ,
                  onPressed: (context) {
                    Navigator.pushNamed(context, EditTaskScreen.routeName,arguments: task);
                  },
                  backgroundColor: MainColors.secondryLightColor,
                  // foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: AppLocalizations.of(context)!.edit,
                ),
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:17.0,horizontal:27 ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 62,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:task.isDone
                          ? MainColors.green
                          : MainColors.secondryLightColor
                  ),
                ),
                SizedBox(width:25,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Text("${task.title}",style:task.isDone?Theme.of(context).textTheme.labelLarge!.copyWith(color: MainColors.green) :Theme.of(context).textTheme.labelLarge,),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: ApplicationProvider.isDark==true
                            ? MainColors.whited
                            : MainColors.blacked,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "${DateFormat("yyyy/MM/dd").format(DateTime.fromMillisecondsSinceEpoch(task.date))}",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: ApplicationProvider.isDark==true
                              ? MainColors.whited
                              : MainColors.blacked,
                        ),
                      ),
                    ],
                  )              ],),
                Spacer(),
                task.isDone?Text(AppLocalizations.of(context)!.done,style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 22,color: MainColors.green)) :InkWell(onTap: () => provider.updateTaskTobeDone(task),child: Container(width: 69,height: 34,decoration: BoxDecoration(color: MainColors.secondryLightColor,borderRadius: BorderRadius.circular(10)),child: Icon(Icons.check , size:35,),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}