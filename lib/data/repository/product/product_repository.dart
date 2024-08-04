import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerence_app/data/services/firebaseTorage/fiebase_storage_service.dart';
import 'package:ecomerence_app/features/shop/model/products_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('isFeatured', isEqualTo: true)
          .limit(4)
          .get();

      if (snapshot.docs.isEmpty) {
        print('No featured products found');
        return [];
      }

      return snapshot.docs.map((e) {
        print('Retrieved product: ${e.data()}');
        return ProductModel.fromSnapshot(e);
      }).toList();
    } on FirebaseException catch (e) {
      print('FirebaseException: ${e.message}');
      throw 'FirebaseException: ${e.message}';
    } on PlatformException catch (e) {
      print('PlatformException: ${e.message}');
      throw 'PlatformException: ${e.message}';
    } catch (e) {
      print('Exception: ${e.toString()}');
      throw 'Something went wrong, please try again';
    }
  }

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(TFirebaseStorageServices());

      for (var product in products) {
        final thumbnail =
            await storage.getImageDatafromAssets(product.thumbnail);
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());
        product.thumbnail = url;

        if (product.images.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images) {
            final assetImage = await storage.getImageDatafromAssets(image);
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);
            imagesUrl.add(url);
          }
          product.images.clear();
          product.images.addAll(imagesUrl);
        }
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      print('FirebaseException: ${e.message}');
      throw 'FirebaseException: ${e.message}';
    } on PlatformException catch (e) {
      print('PlatformException: ${e.message}');
      throw 'PlatformException: ${e.message}';
    } catch (e) {
      print('Exception: ${e.toString()}');
      throw 'Something went wrong, please try again';
    }
  }
}
