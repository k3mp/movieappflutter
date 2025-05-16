import 'package:flutter/material.dart';
import 'package:trialnderror/configs/colours.dart';
import 'package:trialnderror/utilities/routes.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: 'Back',
          onPressed: () {
            if (Get.offAllNamed(AppRoutes.home)?.canPop() ?? false) {
              Get.offAllNamed(AppRoutes.home);
            } else {
              print("Cannot go back from here, try again later");
            }
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Kemp",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: textColortwo,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "kemp@gmail.com", //rwdemail
                style: TextStyle(
                  fontSize: 16,
                  color: randomOne,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    ProfileOption(
                      icon: Icons.settings,
                      text: "Settings",
                      onTap: () {
                        print("Go to settings");
                      },
                    ),
                    ProfileOption(
                      icon: Icons.account_circle,
                      text: "Account Details",
                      onTap: () {
                        print("Go to account details");
                      },
                    ),
                    ProfileOption(
                      icon: Icons.notifications,
                      text: "Notifications",
                      onTap: () {
                        print("Go to notifications");
                      },
                    ),
                    ProfileOption(
                      icon: Icons.help,
                      text: "Help & Support",
                      onTap: () {
                        print("Go to help & support");
                      },
                    ),
                    ProfileOption(
                      icon: Icons.security,
                      text: "Privacy Policy",
                      onTap: () {
                        print("Go to privacy policy");
                      },
                    ),
                    ProfileOption(
                      icon: Icons.logout,
                      text: "Log Out",
                      textColor: randomOne,
                      iconColor: mainColor,
                      onTap: () {
                        print("Log out");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Future? {
  canPop() {}
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? textColortwo),
            const SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
