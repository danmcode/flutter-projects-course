import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  //Llave global que hace referencia al Formulario
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print('$email - $password');
    return formKey.currentState?.validate() ?? false;
  }
}
