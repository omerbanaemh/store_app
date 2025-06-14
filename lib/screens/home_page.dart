import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/add_product_page.dart';
import 'package:store_app/services/categories_service.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/category_section.dart';
import 'package:store_app/widgets/product_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePAge';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'all';
  List<ProductModel> products = [];
  bool loading = true;
  Future<void> _updateProducts(String category) async {
      selectedCategory = category;
      if (category == 'all') {
        loading = true;
        setState(() { });
        products = await AllProductsService().getAllProducts();
        loading = false;
      } else {
        loading = true;
        setState(() { });
        products = await CategoriesService().getCategoriesProducts(categoryName: category) ;
        loading = false;
      }
      setState(() { });
  }

  void loadProducts() async {
    products = await AllProductsService().getAllProducts();
    loading= false;
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    loadProducts();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          CategorySection(
              selectedCategory: selectedCategory,
              onCategorySelected: _updateProducts
          ),
          loading ?
          const Center(
            child: CircularProgressIndicator(),
          ):
          ProductSection(products: products)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: ()=> Navigator.pushNamed(context, AddProductPage.id),
        child: const Icon(Icons.add),
      ),
    );
  }
}
