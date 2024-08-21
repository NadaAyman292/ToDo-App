import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class EditTextFormField extends StatelessWidget {
  final String? labelText;
  final String? initialValue;
  final void Function(String)? onChanged;
  const EditTextFormField(
      {super.key, this.labelText, this.initialValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      style: TextStyle(
          color:
              provider.mode == ThemeMode.light ? Colors.black : Colors.white),
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
