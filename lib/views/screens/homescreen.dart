import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trialnderror/configs/colours.dart';
import 'package:trialnderror/controllers/homescreen_Controller.dart';
import 'package:trialnderror/views/screens/dashboardscreen.dart';
import 'package:trialnderror/views/screens/films.dart';
import 'package:trialnderror/views/screens/genre.dart';
import 'package:trialnderror/views/screens/profile.dart';

HomeScreenController homeScreenController = HomeScreenController();
var myScreen = [Dashboard(), Genre(), Films(), Profile()];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColortwo,
      bottomNavigationBar: Obx(
        () => Theme(
          data: Theme.of(context).copyWith(
            canvasColor: textColortwo,
          ),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: "Dashboard",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "Genre"),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: "Films"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
            unselectedItemColor: backgroundcolourtwo,
            selectedItemColor: textColour,
            currentIndex: homeScreenController.selectedPageIndex.value,
            onTap: (index) => homeScreenController.updateSelection(index),
            showUnselectedLabels: true,
          ),
        ),
      ),
      body: Obx(() => myScreen[homeScreenController.selectedPageIndex.value]),
    );
  }
}
