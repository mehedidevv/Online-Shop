import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DialController extends GetxController {
  Future<void> openDialPad() async {
    final Uri dialUri = Uri(scheme: 'tel', path: '');
    if (await canLaunchUrl(dialUri)) {
      await launchUrl(dialUri);
    } else {
      Get.snackbar('Error', 'Could not open the dial pad');
    }
  }
}
