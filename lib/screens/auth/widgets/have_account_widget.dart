import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class HaveAccountWidget extends StatelessWidget {
  final void Function()? onTap;
  final String textOne;
  final String textTwo;
  const HaveAccountWidget(
      {super.key, this.onTap, required this.textOne, required this.textTwo});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(children: [
            TextSpan(
                text: textOne,
                style: TextStyle(
                  color: provider.mode == ThemeMode.light
                      ? Colors.black
                      : Colors.white,
                )),
            TextSpan(
                text: textTwo,
                style: const TextStyle(
                    color: MyColors.primaryLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ]),
        ),
      ),
    );
  }
}
