import 'package:flutter/material.dart';
import 'package:todo_app/utiles/theme/colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
      padding: EdgeInsets.zero,
      shape: CircularNotchedRectangle(),
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    primaryColor: MyColors.primaryLightColor,
    scaffoldBackgroundColor: MyColors.bkGroundLightColor,
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        backgroundColor: MyColors.primaryLightColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: MyColors.primaryLightColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );

  ///   darkk   ////
  static ThemeData darkTheme = ThemeData(
    bottomAppBarTheme: const BottomAppBarTheme(
      color: MyColors.secondryDarkColor,
      padding: EdgeInsets.zero,
      shape: CircularNotchedRectangle(),
    ),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: MyColors.secondryDarkColor),
    scaffoldBackgroundColor: MyColors.bkGroundDarkColor,
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        backgroundColor: MyColors.primaryLightColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedItemColor: MyColors.primaryLightColor,
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );
}
