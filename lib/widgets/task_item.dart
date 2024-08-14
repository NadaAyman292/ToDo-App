import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helper/firebase_functions.dart';

import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/screens/edit/edite_task_screen.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class TaskItem extends StatelessWidget {
  TaskModel model;
  TaskItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<ThemeProvider>(context);
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: provider.mode == ThemeMode.light
              ? Colors.white
              : MyColors.secondryDarkColor,
          borderRadius: BorderRadius.circular(24)),
      width: double.infinity,
      height: 100,
      child: Slidable(
        startActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FireBaseFunctions.deleteTask(model.id);
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(18),
              topLeft: Radius.circular(18),
            ),
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, EditTaskScreen.routeName,
                  arguments: model);
            },
            backgroundColor: MyColors.primaryLightColor,
            icon: Icons.edit,
            label: 'Edit',
          )
        ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: height * 0.1,
                width: width * 0.008,
                color: model.isDone ? Colors.green : MyColors.primaryLightColor,
              ),
              SizedBox(
                width: width * 0.028,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: model.isDone
                              ? Colors.green
                              : MyColors.primaryLightColor),
                    ),
                    Text(
                      model.description,
                      style: TextStyle(
                          fontSize: 18,
                          color: provider.mode == ThemeMode.light
                              ? Colors.black
                              : Colors.white),
                    ),
                  ],
                ),
              ),
              model.isDone
                  ? Text(
                      "DONE!",
                      style: TextStyle(color: Colors.green, fontSize: 22),
                    )
                  : IconButton(
                      onPressed: () {
                        model.isDone = true;
                        FireBaseFunctions.upDateTask(model);
                      },
                      icon: Icon(
                        Icons.done,
                        size: 30,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(80, 40),
                          backgroundColor: MyColors.primaryLightColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
