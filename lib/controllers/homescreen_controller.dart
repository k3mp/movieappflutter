import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var selectedPageIndex = 0.obs;

  updateSelection(pos) => selectedPageIndex.value = pos;
}
