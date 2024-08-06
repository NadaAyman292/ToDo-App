import 'package:flutter/material.dart';
import 'package:todo_app/tabs/settings_tap.dart';
import 'package:todo_app/tabs/task_tab.dart';
import 'package:todo_app/utiles/theme/colors.dart';
import 'package:todo_app/widgets/add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homescreen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: MyColors.bkGroundLightColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: AddTaskBottomSheet(),
                  );
                });
          },
          backgroundColor: MyColors.primaryLightColor,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.transparent)),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          notchMargin: 8,
          padding: EdgeInsets.zero,
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (int index) {
                selectedIndex = index;
                setState(() {});
              },
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: MyColors.primaryLightColor,
              unselectedItemColor: Colors.grey,
              iconSize: 30,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    label: "",
                    icon: ImageIcon(AssetImage(
                      "assets/images/icon_list.png",
                    ))),
                BottomNavigationBarItem(
                    label: "",
                    icon: ImageIcon(AssetImage(
                      "assets/images/icon_settings.png",
                    )))
              ]),
        ),
        appBar: AppBar(
          backgroundColor: MyColors.primaryLightColor,
          title: const Text(
            "To Do",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        body: tabs[selectedIndex]);
  }

  List<Widget> tabs = [TasksTab(), SettingsTab()];
}
