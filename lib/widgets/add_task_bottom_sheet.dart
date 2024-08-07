import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helper/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "add_new_task".tr(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: provider.mode == ThemeMode.light
                        ? Colors.black
                        : Colors.white),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            TextField(
              style: TextStyle(
                  color: provider.mode == ThemeMode.light
                      ? Colors.black
                      : Colors.white),
              controller: titleController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: MyColors.primaryLightColor)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: MyColors.primaryLightColor)),
                labelText: "title".tr(),
                labelStyle: TextStyle(color: MyColors.primaryLightColor),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            TextField(
              style: TextStyle(
                  color: provider.mode == ThemeMode.light
                      ? Colors.black
                      : Colors.white),
              controller: descriptionController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide:
                        const BorderSide(color: MyColors.primaryLightColor)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                labelText: "description".tr(),
                labelStyle: TextStyle(color: MyColors.primaryLightColor),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              "select_date".tr(),
              style: TextStyle(
                  fontSize: 20,
                  color: provider.mode == ThemeMode.light
                      ? Colors.black
                      : Colors.white),
            ),
            GestureDetector(
              onTap: () {
                chooseYourDate();
              },
              child: Center(
                child: Text(
                  selectedDate.toString().substring(0, 10),
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
              height: 12,
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primaryLightColor),
                    onPressed: () {
                      TaskModel model = TaskModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        date: selectedDate.microsecondsSinceEpoch,
                      );
                      FireBaseFunctions.addTask(model).then((value) {
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      "add".tr(),
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
  }
}
