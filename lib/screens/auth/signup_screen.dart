import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helper/firebase_functions.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/screens/auth/login_screen.dart';
import 'package:todo_app/screens/auth/widgets/custom_text.dart';
import 'package:todo_app/screens/auth/widgets/have_account_widget.dart';
import 'package:todo_app/utiles/theme/colors.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  static const String routName = "SignUpScreen";
  SignUpScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      bottomNavigationBar: HaveAccountWidget(
        onTap: () {
          Navigator.pop(context);
        },
        textOne: "have_an_account?".tr(),
        textTwo: "login".tr(),
      ),
      backgroundColor: provider.mode == ThemeMode.light
          ? Colors.white
          : MyColors.bkGroundDarkColor,
      appBar: AppBar(
        title: Text("signup".tr()),
        backgroundColor: MyColors.primaryLightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(text: "email".tr()),
                AuthTextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "please enter your email";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);
                    if (!emailValid) {
                      return "please enter a valid email format";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: "enter_your_email".tr(),
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTextWidget(text: "username".tr()),
                AuthTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your username";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  controller: userNameController,
                  hintText: "enter_your_username".tr(),
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTextWidget(text: "phone_number".tr()),
                AuthTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your phone";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  hintText: "enter_your_phone_number".tr(),
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTextWidget(text: "age".tr()),
                AuthTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your age";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  hintText: "enter_your_age".tr(),
                ),
                const SizedBox(
                  height: 18,
                ),
                CustomTextWidget(text: "password".tr()),
                AuthTextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "please enter your password";
                    }
                    bool regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value!);
                    if (!regex) {
                      return "please enter a valid password format";
                    }
                    return null;
                  },
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  hintText: "enter_your_password".tr(),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "signup".tr(),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FireBaseFunctions.createAccountAuth(
                          age: int.parse(ageController.text),
                          phone: phoneController.text,
                          userName: userNameController.text,
                          emailController.text,
                          passwordController.text, onError: (error) {
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
                                        child: Text("cancel")),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Ok")),
                                  ],
                                ));
                      }, onSuccess: () {
                        Navigator.pushNamed(context, LoginScreen.routName);
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
