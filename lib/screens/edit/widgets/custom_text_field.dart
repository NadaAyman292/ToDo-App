import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  const CustomTextField({super.key, this.controller, this.labelText});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return TextField(
      style: TextStyle(
          color:
              provider.mode == ThemeMode.light ? Colors.black : Colors.white),
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: MyColors.primaryLightColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: MyColors.primaryLightColor)),
        labelText: labelText,
        labelStyle: TextStyle(color: MyColors.primaryLightColor),
      ),
    );
  }
}
