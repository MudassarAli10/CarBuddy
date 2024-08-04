import 'package:ecomerence_app/data/repository/product/product_repository.dart';
import 'package:ecomerence_app/features/shop/model/products_model.dart';
import 'package:ecomerence_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final isLoading = false.obs;
  final productRepositry = Get.put(ProductRepository());
  RxList<ProductModel> featureProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      final products = await productRepositry.getFeaturedProducts();
      if (products.isEmpty) {
        print('No products to display');
      } else {
        featureProducts.assignAll(products);
        print('Fetched products: ${products.map((e) => e.name).toList()}');
      }
    } catch (e) {
      print('Error fetching products: $e');
      TLoaders.errorSnackBar(title: 'OH Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
