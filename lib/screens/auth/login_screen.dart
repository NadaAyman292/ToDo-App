import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helper/firebase_functions.dart';
import 'package:todo_app/provider/my_provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/screens/auth/signup_screen.dart';
import 'package:todo_app/screens/auth/widgets/custom_text.dart';
import 'package:todo_app/screens/auth/widgets/have_account_widget.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/utiles/theme/colors.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routName = "loginScreen";
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      bottomNavigationBar: HaveAccountWidget(
        textOne: "don't_have_account?".tr(),
        textTwo: "signup".tr(),
        onTap: () {
          Navigator.pushNamed(context, SignUpScreen.routName);
        },
      ),
      backgroundColor: provider.mode == ThemeMode.light
          ? Colors.white
          : MyColors.bkGroundDarkColor,
      appBar: AppBar(
        title: Text(
          "login".tr(),
          style: TextStyle(
              color: provider.mode == ThemeMode.light
                  ? Colors.white
                  : Colors.black),
        ),
        backgroundColor: MyColors.primaryLightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "email".tr(),
              ),
              const SizedBox(
                height: 18,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                hintText: "enter_your_email".tr(),
              ),
              const SizedBox(
                height: 18,
              ),
              CustomTextWidget(
                text: "password".tr(),
              ),
              const SizedBox(
                height: 18,
              ),
              CustomTextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                hintText: "enter_your_password".tr(),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "login".tr(),
                onPressed: () {
                  FireBaseFunctions.loginUser(
                      emailController.text, passwordController.text,
                      onSuccess: (label) {
                    pro.initUser();
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.routeName, (route) => false,
                        arguments: label);
                  }, onError: (error) {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Error"),
                              content: Text(error),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Okay!!!"))
                              ],
                            ));
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
