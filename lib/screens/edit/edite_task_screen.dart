import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helper/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/screens/auth/widgets/custom_text.dart';
import 'package:todo_app/screens/edit/widgets/custom_text_field.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class EditTaskScreen extends StatefulWidget {
  static const String routeName = "editScreen";
  EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var model = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "edit_task".tr(),
          style: TextStyle(
              color: provider.mode == ThemeMode.light
                  ? Colors.white
                  : Colors.black),
        ),
        backgroundColor: MyColors.primaryLightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomTextWidget(
                text: "edit_task".tr(),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            EditTextFormField(
              initialValue: model.title,
              onChanged: (value) {
                model.title = value;
              },
              labelText: "title".tr(),
            ),
            const SizedBox(
              height: 22,
            ),
            EditTextFormField(
              initialValue: model.description,
              onChanged: (value) {
                model.description = value;
              },
              labelText: "description".tr(),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextWidget(
              text: "select_date".tr(),
            ),
            GestureDetector(
              onTap: () async {
                DateTime? newDate = await chooseYourDate();
                if (newDate != null) {
                  model.date = newDate.millisecondsSinceEpoch;
                  setState(() {});
                }
              },
              child: Center(
                child: Text(
                  DateFormat.yMd().format(DateUtils.dateOnly(
                      DateTime.fromMillisecondsSinceEpoch(model.date ?? 0))),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: provider.mode == ThemeMode.light
                          ? Colors.black
                          : Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primaryLightColor),
                    onPressed: () async {
                      await FireBaseFunctions.upDateTask(model);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "save_changes".tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ))),
          ],
        ),
      ),
    );
  }

  chooseYourDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
    return chosenDate;
  }
}
