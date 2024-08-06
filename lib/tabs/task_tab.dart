import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utiles/theme/colors.dart';
import 'package:todo_app/widgets/task_item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(children: [
      CalendarTimeline(
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),
        onDateSelected: (date) => print(date),
        leftMargin: 20,
        monthColor: Colors.black,
        dayColor: MyColors.primaryLightColor,
        activeDayColor: Colors.white,
        activeBackgroundDayColor: MyColors.primaryLightColor,
        selectableDayPredicate: (date) => date.day != 23,
        locale: 'en_ISO',
      ),
      SizedBox(
        height: height * 0.026,
      ),
      Expanded(
        child: ListView.builder(
            itemCount: 60,
            itemBuilder: (context, index) {
              return TaskItem();
            }),
      )
    ]);
  }
}
