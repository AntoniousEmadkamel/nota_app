import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../shared/styles/colors.dart';
import '../auth_layout/auth_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 52,left: 31,right: 31),
            width:double.infinity,
            height: 157,
            color: Theme.of(context).colorScheme.onSecondary,
            child: Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.bodyLarge),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 38),
            child: Row(children: [
              Text(provider.isDark==true? AppLocalizations.of(context)!.dark : AppLocalizations.of(context)!.light ,style:provider.isDark==true ?Theme.of(context).textTheme.bodySmall?.copyWith(color: MainColors.whited):Theme.of(context).textTheme.bodySmall,),
              Spacer(),
              CupertinoSwitch(value: provider.isDark, onChanged: (value) => provider.changeMode(value),)
            ],),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 38),
            child: Row(
            children: [
                Text(provider.english? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic,style:provider.isDark==true ?Theme.of(context).textTheme.bodySmall?.copyWith(color: MainColors.whited):Theme.of(context).textTheme.bodySmall,),
                Spacer(),
                CupertinoSwitch(value: provider.english, onChanged: (value) => provider.changeLanguage(value),)
              ],),
          ),
          // IconButton(onPressed: (){Navigator.pushNamedAndRemoveUntil(context, AuthLayout.routeName, (route) => false,);}, icon: Icon(Icons.exit_to_app_outlined))

        ],),
    );  
  }
}