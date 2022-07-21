// ignore_for_file: await_only_futures

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Images {
  File? image;
  final imagePicker = ImagePicker();

  Future<File?> uploadImageFromCamera() async {
    try {
      var pickedImageFromCamera =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (pickedImageFromCamera != null) {
        image = await File(pickedImageFromCamera.path);
        return image;
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  //Future<String> _execute(Function function) async { }

  Future<File?> uploadImageFromGallery() async {
    try {
      var pickedImageFromGallery =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImageFromGallery != null) {
        image =await File(pickedImageFromGallery.path);
        return image;
      }
      return null;
    } catch (_) {
      return null;
    }
  }
}
