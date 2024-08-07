import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helper/firebase_functions.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/utiles/theme/colors.dart';
import 'package:todo_app/widgets/task_item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<ThemeProvider>(context);
    return Column(children: [
      CalendarTimeline(
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),
        onDateSelected: (date) => print(date),
        leftMargin: 20,
        monthColor:
            provider.mode == ThemeMode.light ? Colors.black : Colors.white,
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
        child: StreamBuilder(
          stream: FireBaseFunctions.getTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text("Something wrong went"),
                  ElevatedButton(onPressed: () {}, child: Text("Try again"))
                ],
              );
            }
            var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList();
            if (tasks?.isEmpty == true) {
              return Text("No tasks");
            }
            return ListView.builder(
                itemCount: tasks!.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    model: tasks[index],
                  );
                });
          },
        ),
      )
    ]);
  }
}
