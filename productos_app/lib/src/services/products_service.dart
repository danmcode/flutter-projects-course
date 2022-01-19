import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/src/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-demo-8637f-default-rtdb.firebaseio.com';
  final List<Products> products = [];
  late Products selectedProduct;

  bool isloading = true;

  ProductsService() {
    loadProducts();
  }

  Future loadProducts() async {
    isloading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final response = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(response.body);

    productsMap.forEach((key, value) {
      final tempProduct = Products.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });

    isloading = false;
    notifyListeners();
  }
}
