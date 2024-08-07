import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

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
          value: context.locale.languageCode,
          isExpanded: true,
          underline: SizedBox(),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: MyColors.primaryLightColor,
          ),
          items: [
            DropdownMenuItem<String>(
              value: 'ar',
              child: Text('arabic'.tr()),
            ),
            DropdownMenuItem<String>(
              value: 'en',
              child: Text('english'.tr()),
            ),
          ],
          onChanged: (String? value) {
            if (value != null) {
              context.setLocale(Locale(value));
            }
          }),
    );
  }
}
