import 'package:flutter/material.dart';
import 'package:preferences_app/src/provider/theme_provider.dart';
import 'package:preferences_app/src/utils/preferences.dart';
import 'package:preferences_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  // int gender = 1;
  // String name = 'Daniel';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ajustes',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                value: Preferences.isDarkmode,
                title: const Text('DarkMode:'),
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  final themeProver =
                      Provider.of<ThemeProvider>(context, listen: false);

                  value
                      ? themeProver.setDarkmode()
                      : themeProver.setLightmode();
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 1,
                title: const Text('Femenino'),
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 2,
                title: const Text('Masculino'),
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 2;
                  setState(() {});
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  initialValue: Preferences.name,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre del usuario',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
