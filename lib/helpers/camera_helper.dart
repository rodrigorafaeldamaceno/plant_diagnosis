import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CameraHelper {
  static final _picker = ImagePicker();

  static Future<File?> pickImage(
      {ImageSource source: ImageSource.camera}) async {
    try {
      var pickedFile = await _picker.pickImage(source: source);

      if (pickedFile == null) {
        return null;
      }

      return File(pickedFile.path);
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }

  static Future<List<File>>? pickImages() async {
    try {
      var pickedFiles = await _picker.pickMultiImage();
      if (pickedFiles == null) {
        return [];
      }

      final files = pickedFiles.map((e) => File(e.path)).toList();

      return files;
      // return File(pickedFile.path);
    } catch (e, s) {
      print(e);
      print(s);
      return [];
    }
  }
}
