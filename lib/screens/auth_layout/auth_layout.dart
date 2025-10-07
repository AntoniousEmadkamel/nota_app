import 'package:fifth/screens/Login_MVVM/login_view_tab.dart';
import 'package:fifth/screens/Signup_MVVM/signup_view_tap.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthLayout extends StatelessWidget {
  static const String routeName="AuthLayout";
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar:AppBar(
            backgroundColor:MainColors.secondryLightColor ,title: Text(AppLocalizations.of(context)!.auth,style: Theme.of(context).textTheme.bodyLarge,),
          bottom: TabBar(
            unselectedLabelColor: Theme.of(context).colorScheme.onErrorContainer,
            labelColor: Theme.of(context).colorScheme.onErrorContainer,
              tabs: [
          Tab(text: AppLocalizations.of(context)!.login,),
          Tab(text: AppLocalizations.of(context)!.signup,)
          ]

          ),),
          body: BottomAppBar(
            height: double.infinity,
            child: TabBarView(children: [
              LoginViewTab(),
              SignUpViewTab()
            ]),
          ),
        ),
      ),
    );
  }
}