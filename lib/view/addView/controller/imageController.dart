// controller/imageController.dart
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPickerContainer extends GetxController {
  final RxList<RxString> selectedImages = List.generate(6, (_) => ''.obs).obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(int index) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImages[index].value = pickedFile.path;
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void clearImage(int index) {
    selectedImages[index].value = '';
  }
}
