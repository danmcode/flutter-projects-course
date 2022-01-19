import 'package:flutter/material.dart';
import 'package:productos_app/src/models/products.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Products product;

  //Copia del objeto producto
  ProductFormProvider(this.product);

  //Verificar si el formulario es valido
  bool isValid() {
    return formKey.currentState?.validate() ?? false;
  }
}
