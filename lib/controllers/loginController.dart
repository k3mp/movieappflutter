import 'package:get/get.dart';

class LoginController extends GetxController {
  var errorMessage = "".obs;
  setErrorMessage(newErrorMessage) {
    errorMessage = newErrorMessage;
  }
}
