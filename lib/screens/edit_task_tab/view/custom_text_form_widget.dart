import 'package:flutter/material.dart';
import '../../../shared/styles/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomTextFormField({
    required this.hintText,
    required this.controller,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:Theme.of(context).textTheme.headlineMedium,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MainColors.bor)
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color:  Theme.of(context).colorScheme.errorContainer)
        ),
        errorStyle: TextStyle(color: Colors.red,),
      ),
    );
  }
}