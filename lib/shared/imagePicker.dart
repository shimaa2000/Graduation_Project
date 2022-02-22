import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Images {
  File? image;
  final imagePicker = ImagePicker();

  uploadImageFromCamera() async {
    var pickedImageFromCamera =
    await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImageFromCamera != null) {
      image = File(pickedImageFromCamera.path);
    } else {}
  }

  //Future<String> _execute(Function function) async { }

  uploadImageFromGallery() async {
    var pickedImageFromGallery =
    await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImageFromGallery != null) {
      image = File(pickedImageFromGallery.path);
    } else {}
  }
}