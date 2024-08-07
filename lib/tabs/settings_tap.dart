import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/widgets/lang_drop_down.dart';
import 'package:todo_app/widgets/mode_drop_down.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "language".tr(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: provider.mode == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        const LanguageDropDown(),
        const SizedBox(
          height: 40,
        ),
        Text(
          "mode".tr(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: provider.mode == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        const ModeDropDown(),
      ]),
    );
  }
}
