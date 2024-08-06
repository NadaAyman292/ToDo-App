import 'package:flutter/material.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
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
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Task Title",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Task Description",
                  style: TextStyle(fontSize: 16),
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
