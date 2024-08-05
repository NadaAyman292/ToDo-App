import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/screens/settings/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}
