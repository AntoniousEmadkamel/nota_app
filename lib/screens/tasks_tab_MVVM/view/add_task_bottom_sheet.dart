import 'package:fifth/screens/tasks_tab_MVVM/task_model.dart';
import 'package:fifth/screens/tasks_tab_MVVM/tasks_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/styles/colors.dart';
import '../../edit_task_tab/view/custom_text_form_widget.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  GlobalKey formKey=GlobalKey<FormState>();
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      height: MediaQuery.of(context).size.height*0.5,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.addnewtask,style: Theme.of(context).textTheme.labelSmall,textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            CustomTextFormField(hintText:AppLocalizations.of(context)!.enteryourtasktitle,controller:titleController,),
            SizedBox(height: 20,),
            CustomTextFormField(hintText:AppLocalizations.of(context)!.enteryourtaskdetails,controller: descriptionController,),
            SizedBox(height: 20,),
            Text(AppLocalizations.of(context)!.selecttime,style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 20,),
            InkWell(
                onTap:() { selectDate(context);},
                child: Text("${selectedDate.toString().substring(0,10)}",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,)),
            SizedBox(height:20,),
            ElevatedButton(
                style:ElevatedButton.styleFrom(backgroundColor: MainColors.secondryLightColor) ,
                onPressed: ()async{
                    TaskModel task=TaskModel(
                        userId: Provider.of<TasksTabViewModel>(context,listen: false).user?.id??"",
                        title: titleController.text,
                        description: descriptionController.text,
                        date:DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch
                    );
                    Provider.of<TasksTabViewModel>(context,listen: false).addTask(task);
                    Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.savetask,style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: MainColors.whited
                ))
            )
          ],
        ),
      ),
    );
  }
  selectDate(BuildContext context) async {
    DateTime? choosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark(
            surface: MainColors.secondryLightColor,
            onSurface: Theme.of(context).colorScheme.onErrorContainer,
            primary: MainColors.secondryLightColor,
            onPrimary: Colors.white,
          ),
          dialogBackgroundColor:Theme.of(context).colorScheme.onError,
        ),
        child: child!,
      );},
    );
    if(choosenDate==null) {return;}
    selectedDate=choosenDate;
    setState(() {});
  }
}