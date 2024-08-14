import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.controller,
      this.keyboardType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      style: TextStyle(
          color: provider.mode == ThemeMode.light ? Colors.black : Colors.white,
          fontSize: 22),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: MyColors.primaryLightColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: MyColors.primaryLightColor,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: MyColors.primaryLightColor,
            )),
      ),
    );
  }
}
