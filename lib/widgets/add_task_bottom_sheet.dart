import 'package:flutter/material.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Add New Task",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: MyColors.primaryLightColor)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: MyColors.primaryLightColor)),
                labelText: "Title",
                labelStyle: TextStyle(color: MyColors.primaryLightColor),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: MyColors.primaryLightColor)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                labelText: "Description",
                labelStyle: TextStyle(color: MyColors.primaryLightColor),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Select Date",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Center(
              child: Text(
                "28/8/2025",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.primaryLightColor),
                    onPressed: () {},
                    child: Text(
                      "Add",
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
}
