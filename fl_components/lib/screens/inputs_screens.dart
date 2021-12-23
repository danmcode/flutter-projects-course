import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  initialValue: 'Daniel Muelas',
                  textCapitalization: TextCapitalization.words,
                  onChanged: (value) => print('value: $value'),
                  validator: (value) {
                    if (value == null) return 'Este campo esta vacio';
                    return value.length < 3 ? 'Minimo de 3 letras' : null;
                  },
                  autovalidateMode: AutovalidateMode.always,
                ),
              ],
            ),
          ),
        ));
  }
}
