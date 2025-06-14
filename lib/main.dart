import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/screens/add_product_page.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id : (context) => const HomePage(),
        UpdateProductPage.id : (context) => UpdateProductPage(),
        AddProductPage.id : (context) => const AddProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
