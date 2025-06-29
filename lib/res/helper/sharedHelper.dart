import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ShareHelper {
  static Future<void> shareCardData({
    required String title,
    required String description,
    required String category,
    required String color,
    required String store,
    required String size,
    required String price,
    required String imageAssetPath,
  }) async {
    try {
      // Load image from asset
      final ByteData bytes = await rootBundle.load(imageAssetPath);
      final Uint8List list = bytes.buffer.asUint8List();

      // Save image to temporary directory
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/shared_image.png').create();
      await file.writeAsBytes(list);

      // Prepare text
      final String shareText = '''
🛍️ Brand: $title
📄 Description: $description
📦 Category: $category
🎨 Color: $color
🏪 Store: $store
📐 Size: $size
💰 Price: $price

Check it out!
''';

      // Share image and text
      await Share.shareXFiles(
        [XFile(file.path)],
        text: shareText,
        subject: 'Recommended Brand: $title',
      );
    } catch (e) {
      print('Error sharing content: $e');
    }
  }
}
