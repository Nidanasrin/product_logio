import 'dart:convert';

import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {

  static Future<Products> fetchProducts() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      var data = response.body;
      print(response.body);
      return productsFromJson(data);
    } else {
      throw Exception("Failed to load products: ${response.statusCode}");
    }
  }

  Future<List<String>> getMainCategories() async {
    final response = await http.get(
        Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = json.decode(response.body);
      List<String> mainCategories = categoriesJson.map((categoriesJson) =>
          categoriesJson.toString()).toList();
      return mainCategories;
    } else {
      throw Exception("Failed to load main categories");
    }
  }
}