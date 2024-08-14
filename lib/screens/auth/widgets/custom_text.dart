import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  const CustomTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color:
              provider.mode == ThemeMode.light ? Colors.black : Colors.white),
    );
  }
}
