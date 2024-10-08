import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/screens/auth/login_screen.dart';
import 'package:todo_app/screens/auth/signup_screen.dart';
import 'package:todo_app/screens/edit/edite_task_screen.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/utiles/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  print('ready in 3...');
  await Future.delayed(const Duration(seconds: 1));
  print('ready in 2...');
  await Future.delayed(const Duration(seconds: 1));
  print('ready in 1...');
  await Future.delayed(const Duration(seconds: 1));
  print('go!');
  FlutterNativeSplash.remove();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.enableNetwork();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()..loadTheme()),
    ],
    child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        saveLocale: true,
        child: ChangeNotifierProvider(
            create: (context) => MyProvider(), child: const MyApp())),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var pro = Provider.of<MyProvider>(context);

    return MaterialApp(
      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        EditTaskScreen.routeName: (context) => EditTaskScreen(),
        LoginScreen.routName: (context) => LoginScreen(),
        SignUpScreen.routName: (context) => SignUpScreen()
      },
      initialRoute: pro.firebaseUser != null
          ? HomeScreen.routeName
          : LoginScreen.routName,
      debugShowCheckedModeBanner: false,
    );
  }
}
