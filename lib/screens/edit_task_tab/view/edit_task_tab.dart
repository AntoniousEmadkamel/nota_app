import 'package:fifth/base.dart';
import 'package:fifth/screens/edit_task_tab/edit_task_connector.dart';
import 'package:fifth/screens/edit_task_tab/edit_task_view_model.dart';
import 'package:fifth/screens/tasks_tab_MVVM/tasks_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shared/styles/colors.dart';
import '../../tasks_tab_MVVM/task_model.dart';
import 'custom_text_form_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName="EditTask";

  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}
GlobalKey formKey=GlobalKey<FormState>();
TextEditingController titleController=TextEditingController();
TextEditingController descriptionController=TextEditingController();
DateTime selectedDate=DateTime.now();

class _EditTaskScreenState extends BaseView<EditTaskScreen , EditTaskViewModel>  implements EditTaskConnector {

  @override
  EditTaskViewModel initMyViewModel() {
    return EditTaskViewModel();
  }
  @override
  Widget build(BuildContext context) {
    var argument=ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(centerTitle: false,title:Text( "ToDo List",)),
      backgroundColor: Theme.of(context).colorScheme.onError,
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.15,
            child: Container(
              padding: EdgeInsets.only(left: 17),
              color: MainColors.secondryLightColor,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text('', style: Theme.of(context).textTheme.bodyLarge,),
                ),
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width *0.90,
            left: 15,
            top: MediaQuery.of(context).size.height*0.05,
            child:Container(
              padding: EdgeInsets.all(25),
              height: MediaQuery.of(context).size.height*0.75,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.edittask,style: Theme.of(context).textTheme.labelSmall,textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    CustomTextFormField(hintText: argument.title,controller:titleController ,),
                    SizedBox(height: 20,),
                    CustomTextFormField(hintText: argument.description,controller: descriptionController,),
                    SizedBox(height: 20,),
                    InkWell(
                        onTap:() { selectDate(context);},
                        child: Text(selectedDate.toString().substring(0,10),style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,)),
                    SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                    ElevatedButton(
                        onPressed: (){
                          TaskModel task=TaskModel(
                              userId: Provider.of<TasksTabViewModel>(context,listen: false).user?.id??"",
                               isDone:argument.isDone ,
                              title: titleController.text,
                              description: descriptionController.text,
                              date:DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
                              id:argument.id
                          );
                          viewModel.updateTask(task);
                          Navigator.pop(context);
                        },
                        child: Text(AppLocalizations.of(context)!.savetask,style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: MainColors.whited
                        ))
                    )
                  ],
                ),
              ),
            ) ,
          ),
        ],
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
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
          ), dialogTheme: DialogThemeData(backgroundColor: Theme.of(context).colorScheme.onError),
        ),
        child: child!,
      );},
    );
    if(chosenDate==null) {return;}
    selectedDate=chosenDate;
    setState(() {});
  }

}