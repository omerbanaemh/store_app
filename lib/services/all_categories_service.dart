import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCateogires() async {
 try {
   List<dynamic> data =await Api().get(url: 'https://fakestoreapi.com/products/categories');
   return data;
 } catch (e) {
   print('Failed to getAllCateogires: $e');
   return [];
 }
  }
}
