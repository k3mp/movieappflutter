import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trialnderror/configs/colours.dart';
import 'package:trialnderror/controllers/loginController.dart';
import 'package:trialnderror/views/widgets/myButton.dart';
import 'package:trialnderror/views/widgets/mytextfield.dart';
import 'package:trialnderror/utilities/routes.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;

LoginController loginController = LoginController();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLogingin = false;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/Logo2.png',
                  height: 250,
                ),
                const SizedBox(height: 1),
                const Text(
                  "WELCOME!",
                  style: TextStyle(
                      fontSize: 60,
                      fontFamily: 'BungeeShade',
                      color: randomOne),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  hint: "Enter username",
                  icon: Icons.person,
                  controller: userNameController,
                  borderColor: backgroundColor,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  hint: "Enter password",
                  icon: Icons.lock,
                  controller: passwordController,
                  borderColor: backgroundColor,
                  obscureText: true, // kuhide password
                ),
                const SizedBox(height: 30),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    MyButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.home);
                      },
                      label: "Login",
                      color: textColortwo,
                    ),
                    if (isLogingin) const CircularProgressIndicator(),
                  ],
                ),
                const SizedBox(height: 10),
                MyButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.registration);
                  },
                  label: "Sign Up",
                  color: textColortwo,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          // ignore: unused_local_variable
                          bool rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text("Remember Me"),
                    const Spacer(),
                    GestureDetector(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: randomOne,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Obx(() => Text(loginController.errorMessage.value)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
