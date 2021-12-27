import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Keys para mantener las referencias
    final GlobalKey<FormState> myFormkey = GlobalKey<FormState>();

    //Map para tomar los valores
    final Map<String, String> formValues = {
      'first_name': 'Daniel',
      'last_name': 'Muelas',
      'email': 'daniel@uao.edu.co',
      'password': '12345',
      'role': 'Admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs & Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),

          //Formulario
          child: Form(
            key: myFormkey,
            child: Column(
              children: [
                //
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre del usuario',
                  formProperty: 'first_name',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 20,
                ),
                //
                CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido del usuario',
                  formProperty: 'last_name',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 20,
                ),
                //
                CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo del usuario',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 20,
                ),
                //
                CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña del usuario',
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 20,
                ),

                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(
                      value: 'Admin',
                      child: Text('Admin'),
                    ),

                    //

                    DropdownMenuItem(
                      value: 'SuperUser',
                      child: Text('SuperUser'),
                    ),

                    //

                    DropdownMenuItem(
                      value: 'Developer',
                      child: Text('Developer'),
                    ),

                    DropdownMenuItem(
                      value: 'JuniorDeveloper',
                      child: Text('JuniorDeveloper'),
                    ),
                  ],
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                //
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: Center(
                      child: Text('Guardar'),
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    if (!myFormkey.currentState!.validate()) {
                      print('Formulario no valido');
                      return;
                    }
                    print(formValues);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
