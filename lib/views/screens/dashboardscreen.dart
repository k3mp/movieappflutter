import 'package:flutter/material.dart';
import 'package:trialnderror/configs/colours.dart';
import 'package:get/get.dart';
import 'package:trialnderror/utilities/routes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    //const String username = "User Name";

    return Scaffold(
      backgroundColor: textColortwo,
      appBar: AppBar(
        backgroundColor: textColortwo,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: backgroundcolourtwo,
            ),
            onPressed: () {
              Get.offAllNamed(AppRoutes.prof);
            },
          ),
        ],
        title: Text(
          "Welcome, Kemp",
          style: const TextStyle(
            //fontFamily: 'Cormorant',
            color: textColour,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Recent Activity",
                style: TextStyle(fontSize: 20, color: textColour),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
