import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productos_app/src/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-demo-8637f-default-rtdb.firebaseio.com';
  final List<Products> products = [];
  late Products selectedProduct;

  File? newPictureFile;

  bool isloading = true;
  bool isSaving = false;

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

  //Metdo para crear o actualizar un profucto
  Future saveorCreateProduct(Products product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      //Es necesario crear
      await createProduct(product);
    } else {
      //Actualizar
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Products product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final response = await http.put(url, body: product.toJson());
    final decodeData = response.body;

    print(decodeData);

    //Actualizar el listtado de productos.

    final index = products.indexWhere((element) => element.id == product.id);

    products[index] = product;

    // for (var element in products) {
    //   if (element.id == product.id) {
    //     element.id = product.id;
    //     element.available = product.available;
    //     element.name = product.name;
    //     element.picture = product.picture;
    //     element.price = product.price;
    //   }
    // }

    return product.id!;
  }

  Future<String> createProduct(Products product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final response = await http.post(url, body: product.toJson());
    final decodeData = json.decode(response.body);

    product.id = decodeData['name'];

    products.add(product);

    // print(decodeData);

    return product.id!;
  }

  void updateSelectedProductImage(String path) {
    selectedProduct.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    isSaving = true;
    notifyListeners();

    String urlCloud =
        'https://api.cloudinary.com/v1_1/danmcode/image/upload?upload_preset=cqhwwq5h';

    final url = Uri.parse(urlCloud);

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo salio mal');
      print(resp.body);
      return null;
    }

    newPictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}
