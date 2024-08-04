import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerence_app/data/services/firebaseTorage/fiebase_storage_service.dart';
import 'package:ecomerence_app/features/shop/model/category_model.dart';
import 'package:ecomerence_app/utils/exceptions/firebase_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //Get All Category
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Category').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }

  //Get Sub CAtegories
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStorageServices());
      for (var category in categories) {
        final file = await storage.getImageDatafromAssets(category.image);
        final url =
            await storage.uploadImageData('Category', file, category.name);
        category.image = url;
        await _db
            .collection('Category')
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong , Please try again';
    }
  }
}
