import 'package:fifth/base.dart';
import 'package:fifth/screens/Login_MVVM/login_connector.dart';
import 'package:fifth/screens/Login_MVVM/login_view_model.dart';
import 'package:fifth/screens/edit_task_tab/view/custom_text_form_widget.dart';
import 'package:flutter/material.dart';
import '../../layout/home_layout.dart';
import '../../shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginViewTab extends StatefulWidget {
  const LoginViewTab({super.key});

  @override
  State<LoginViewTab> createState() => _LoginTabState();
}

class _LoginTabState extends BaseView<LoginViewTab,LoginViewModel>implements LoginConnector {
  var formKey=GlobalKey<FormState>();

  var emailController=TextEditingController();

  var passwordController=TextEditingController();

  @override
  LoginViewModel initMyViewModel() {
    return LoginViewModel();
  }

  @override
  goToHome() {
    Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName,(route)=>false);
  }
  @override
  void initState() {
    super.initState();
    viewModel.connector=this;
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
            CustomTextFormField(hintText: AppLocalizations.of(context)!.email, controller: emailController),
            CustomTextFormField(hintText: AppLocalizations.of(context)!.password, controller: passwordController),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(backgroundColor:WidgetStatePropertyAll(MainColors.secondryLightColor)),
              onPressed: () {viewModel.Login (emailController.text, passwordController.text,context);},
              child:  Text(AppLocalizations.of(context)!.login,style: TextStyle(color:Theme.of(context).colorScheme.onErrorContainer),),
            ),
          ],
        ),
      ),
    );
  }

}