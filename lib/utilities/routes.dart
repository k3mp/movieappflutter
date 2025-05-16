import 'package:get/get.dart';
import 'package:trialnderror/views/screens/homescreen.dart';
import 'package:trialnderror/views/screens/login.dart';
import 'package:trialnderror/views/screens/registration.dart';
import 'package:trialnderror/views/screens/profile.dart';
//import 'package:trialnderror/views/screens/registration.dart';

class AppRoutes {
  static String login = '/Login';
  static String home = '/HomeScreen';
  static String registration = '/RegisterScreen';
  static String prof = '/Profile';

  static String getLogin() => login;
  static String getHome() => home;
  static String getRegistration() => registration;
  static String getProf() => prof;

  static List<GetPage> routes = [
    GetPage(name: login, page: () => Login()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: registration, page: () => RegisterScreen()),
    GetPage(name: prof, page: () => Profile()),
  ];

  static final initial = login;
}
