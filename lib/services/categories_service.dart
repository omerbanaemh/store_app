import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
  try {
    List<dynamic> data   =  await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productsList = [];
    productsList = data.map((item) => ProductModel.fromJson(item)).toList();
    return productsList;
  } catch (e) {
    print('Failed to load products: $e');
    return [];
  }
   
  }
}
