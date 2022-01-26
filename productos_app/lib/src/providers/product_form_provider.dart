import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Products product;

  //Copia del objeto producto
  ProductFormProvider(this.product);

  //Actualizar el swich
  updateAvailability(bool value) {
    print(value);
    product.available = value;
    notifyListeners();
  }

  //Verificar si el formulario es valido
  bool isValid() {
    print(product.name);
    print(product.price);
    print(product.available);
    return formKey.currentState?.validate() ?? false;
  }
}
