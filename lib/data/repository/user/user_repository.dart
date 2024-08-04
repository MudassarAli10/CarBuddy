import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerence_app/data/repository/authentication/authentication_repository.dart';
import 'package:ecomerence_app/features/personalization/model/user_model.dart';
import 'package:ecomerence_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecomerence_app/utils/exceptions/format_exceptions.dart';
import 'package:ecomerence_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // Function to Save user data
  Future<void> savedUserRecord(UserModel user) async {
    try {
      await _db.collection('User').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      // ignore: nullable_type_in_catch_clause, dead_code_on_catch_subtype
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  // Function to fetch user data based on user id
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('User')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  // Function to update user datain firestore
  Future<void> updateUserRecord(UserModel updateUser) async {
    try {
      await _db.collection('User').doc(updateUser.id).set(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      // ignore: nullable_type_in_catch_clause, dead_code_on_catch_subtype
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  //Update any single field of data
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('User')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
      // ignore: nullable_type_in_catch_clause, dead_code_on_catch_subtype
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  // Function to delete user data from firestore
  Future<void> deleteUserRecord(String userId) async {
    try {
      await _db.collection('User').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  //upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      File imageFile = File(image.path); // Convert XFile to File
      String fileName = DateTime.now()
          .millisecondsSinceEpoch
          .toString(); // Generate a unique file name
      final ref = FirebaseStorage.instance
          .ref(path)
          .child(fileName); // Use the unique file name
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }
}
