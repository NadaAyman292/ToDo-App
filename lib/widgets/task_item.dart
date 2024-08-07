// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/theme_provider.dart';
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: provider.mode == ThemeMode.light
              ? Colors.white
              : MyColors.secondryDarkColor,
          borderRadius: BorderRadius.circular(24)),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Container(
            height: height * 0.1,
            width: width * 0.008,
            color: MyColors.primaryLightColor,
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
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primaryLightColor),
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
          IconButton(
            onPressed: () {},
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
    );
  }
}
