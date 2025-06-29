import 'package:get/get.dart';

class HeartController extends GetxController {
  var isLiked = false.obs;

  void toggleLike() {
    isLiked.value = !isLiked.value;
  }
}
