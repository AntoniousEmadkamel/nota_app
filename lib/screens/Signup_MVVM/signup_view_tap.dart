import 'package:fifth/base.dart';
import 'package:fifth/screens/Signup_MVVM/Signup_ViewModel.dart';
import 'package:fifth/screens/Signup_MVVM/Signup_connector.dart';
import 'package:fifth/screens/auth_layout/auth_layout.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import '../edit_task_tab/view/custom_text_form_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpViewTab extends StatefulWidget {
  const SignUpViewTab({super.key});

  @override
  State<SignUpViewTab> createState() => _SignUpViewTabState();
}

class _SignUpViewTabState extends BaseView<SignUpViewTab, SignupViewModel> implements SignupConnector {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  goToLogin() {
    Navigator.pushNamedAndRemoveUntil(context, AuthLayout.routeName, (route)=>false);
  }

  @override
  SignupViewModel initMyViewModel() {
    return SignupViewModel();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(hintText:AppLocalizations.of(context)!.name, controller: nameController),
            CustomTextFormField(hintText:AppLocalizations.of(context)!.age, controller: ageController),
            CustomTextFormField(hintText:AppLocalizations.of(context)!.email, controller: emailController),
            CustomTextFormField(hintText:AppLocalizations.of(context)!.password, controller: passwordController),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(MainColors.secondryLightColor)),
              onPressed: () {
                  viewModel.createUserForSignup(nameController.text,int.parse(ageController.text), emailController.text, passwordController.text,context);
              },
              child:  Text(AppLocalizations.of(context)!.signup,style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),),
            ),
          ],
        ),
      ),
    );
  }


}