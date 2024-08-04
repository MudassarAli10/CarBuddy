import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageServices extends GetxController {
  static TFirebaseStorageServices get instace => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDatafromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loaing image data:$e';
    }
  }

  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FirebaseException :${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error:${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception :${e.message}';
      } else {
        throw 'Something Went Wrong! Please Try Again';
      }
    }
  }

  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putData(File(image.path) as Uint8List);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FirebaseException :${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error:${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception :${e.message}';
      } else {
        throw 'Something Went Wrong! Please Try Again';
      }
    }
  }
}
