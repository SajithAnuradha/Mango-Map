import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static Future<File?> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }
}
