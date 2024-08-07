import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class ModeDropDown extends StatelessWidget {
  const ModeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: provider.mode == ThemeMode.light
              ? Colors.white
              : MyColors.secondryDarkColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: MyColors.primaryLightColor)),
      child: DropdownButton<String>(
          style: TextStyle(color: MyColors.primaryLightColor),
          value: provider.mode == ThemeMode.dark ? 'dark' : 'light',
          isExpanded: true,
          underline: SizedBox(),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: MyColors.primaryLightColor,
          ),
          items: [
            DropdownMenuItem<String>(
              value: 'light',
              child: Text('light'.tr()),
            ),
            DropdownMenuItem<String>(
              value: 'dark',
              child: Text('dark'.tr()),
            ),
          ],
          onChanged: (String? value) {
            if (value != null) {
              ThemeMode selectMode =
                  value == 'light' ? ThemeMode.light : ThemeMode.dark;
              provider.changeTheme(selectMode);
            }
          }),
    );
  }
}
