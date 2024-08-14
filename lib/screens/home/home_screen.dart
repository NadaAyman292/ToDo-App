import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helper/firebase_functions.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/screens/auth/login_screen.dart';
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
    var pro = Provider.of<MyProvider>(context);

    return Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.primaryLightColor,
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
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent)),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (int index) {
                selectedIndex = index;
                setState(() {});
              },
              iconSize: 30,
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
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, LoginScreen.routName);
                },
                icon: Icon(Icons.logout))
          ],
          backgroundColor: MyColors.primaryLightColor,
          title: Text(
            "Hello ${pro.userModel?.userName}",
          ),
        ),
        body: tabs[selectedIndex]);
  }

  List<Widget> tabs = [TasksTab(), SettingsTab()];
}
