//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart'; // Corrected import
//import 'package:trialnderror/main.dart';

void main() {
  testWidgets('App Launches Successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(GetMaterialApp(
      home: const GetMaterialApp(), // Replace MyApp with your initial widget
    ));

    // Add a short delay to allow initial frames to render
    await tester.pump(const Duration(milliseconds: 200));

    // Verify that something is on the screen (e.g., a text)
    expect(
        find.text('WELCOME!'), findsOneWidget); // Changed "0" with a test text
  });
}
