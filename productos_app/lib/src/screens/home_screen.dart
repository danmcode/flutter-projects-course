import 'package:flutter/material.dart';
import 'package:productos_app/src/models/models.dart';
import 'package:productos_app/src/screens/loading_screen.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/src/services/products_service.dart';
import 'package:productos_app/src/services/services.dart';
import 'package:productos_app/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    if (productsService.isloading) {
      return const LoadingScreen();
    }

    List<Products> products = productsService.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: ProductCard(product: products[index]),
            onTap: () {
              productsService.selectedProduct = products[index].copy();
              Navigator.pushNamed(context, 'product');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //Crear una copia de un objeto producto para trabajar
          productsService.selectedProduct = Products(
            available: false,
            name: '',
            price: 0,
          );
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}
