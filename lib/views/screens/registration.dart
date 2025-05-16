import 'package:flutter/material.dart';
import 'package:trialnderror/configs/colours.dart';
import 'package:trialnderror/views/widgets/mybutton.dart';
import 'package:trialnderror/views/widgets/mytextfield.dart';
import 'package:trialnderror/utilities/routes.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers for text fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isRegistering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColortwo,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            Get.offAllNamed(AppRoutes.login);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyTextField(
                  hint: "Enter your first name",
                  icon: Icons.person_2_rounded,
                  controller: fnameController,
                  borderColor: backgroundColor,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  hint: "Enter your last name",
                  icon: Icons.person_2_rounded,
                  controller: lnameController,
                  borderColor: backgroundColor,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  hint: "Enter username",
                  icon: Icons.person,
                  controller: usernameController,
                  borderColor: backgroundColor,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  hint: "Enter email",
                  icon: Icons.email,
                  controller: emailController,
                  borderColor: backgroundColor,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  hint: "Enter phone number",
                  icon: Icons.phone,
                  controller: phoneController,
                  borderColor: backgroundColor,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  hint: "Enter password",
                  icon: Icons.lock,
                  controller: passwordController,
                  borderColor: backgroundColor,
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    MyButton(
                      onPressed: () async {
                        setState(() {
                          isRegistering = true;
                        });

                        final String fname = fnameController.text;
                        final String lname = lnameController.text;
                        final String username = usernameController.text;
                        final String email = emailController.text;
                        final String phone = phoneController.text;
                        final String password = passwordController.text;

                        final url = Uri.parse(
                            "http://localhost/ecommerce/registration.php?fname=jane&lname=james&phone=0987654321&email=jj@gmail.com&password=jj2025");
                        try {
                          final response = await http.post(
                            url,
                            headers: {'Content-Type': 'application/json'},
                            body: jsonEncode({
                              'fname': fname,
                              'lname': lname,
                              'username': username,
                              'email': email,
                              'phone': phone,
                              'password': password,
                            }),
                          );

                          if (response.statusCode == 200) {
                            final data = jsonDecode(response.body);

                            if (data['success']) {
                              Get.offAllNamed(AppRoutes.login);
                              Get.snackbar(
                                "Account Created",
                                "Account Created, please sign in again at the login page",
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else {
                              print(
                                  'Error registering: ${response.statusCode}');
                              Get.snackbar(
                                "Error",
                                "HTTP Request not sent, may be because of connection issues",
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          }
                        } catch (error) {
                          print('Error connecting: $error');
                          Get.snackbar(
                            "Error",
                            "HTTP Request not sent",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        } finally {
                          setState(() {
                            isRegistering = false;
                          });
                        }
                      },
                      label: "Register",
                      color: backgroundcolourtwo,
                    ),
                    if (isRegistering) const CircularProgressIndicator(),
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
