import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trialnderror/utilities/routes.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    ),
  );
}
