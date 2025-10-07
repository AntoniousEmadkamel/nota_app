import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class BaseConnector{
  showLoading();
  hideLoading();
  showMessage(String message);
}

class BaseViewModel<Connector extends BaseConnector> extends ChangeNotifier {
  Connector? connector;
}

abstract class BaseView<St extends StatefulWidget , ViewModel extends BaseViewModel> extends State<St> implements BaseConnector {

  late ViewModel viewModel;

  ViewModel initMyViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initMyViewModel();
    viewModel.connector = this; // Add this line to set the connector
  }

  @override
  hideLoading() {
    Navigator.pop(context);
  }

  @override
  showLoading() {
    return showDialog(
        context: context, builder: (context) => AlertDialog(
        scrollable: true, // <-- Set it to true
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        content: Center(child: CircularProgressIndicator(),)),);
  }

  @override
  showMessage(String message) {
    showDialog(barrierDismissible: false, context: context, builder: (context) {
      return AlertDialog(
        scrollable: true, // <-- Set it to true
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Center(child: Text(AppLocalizations.of(context)!.error),),
        content: Text(message),
        actions: [ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text(AppLocalizations.of(context)!.ok,style:TextStyle(color: Colors.white)))],);
    },);
  }
}
