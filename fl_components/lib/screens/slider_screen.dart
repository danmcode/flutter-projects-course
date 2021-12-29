import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  //
  double _sliderValue = 50;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
            min: 0,
            max: 1000,
            activeColor: AppTheme.primary,
            value: _sliderValue,
            onChanged: _sliderEnabled
                ? (value) {
                    _sliderValue = value;
                    print(value);
                    setState(() {});
                  }
                : null,
          ),

          //Checkbox
          // Checkbox(
          //   value: _sliderEnabled,
          //   onChanged: (value) {
          //     _sliderEnabled = value ?? true;
          //     setState(() {});
          //   },
          // ),

          //CheckBox List Tile
          CheckboxListTile(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnabled,
            onChanged: (value) => setState(
              () {
                _sliderEnabled = value ?? true;
              },
            ),
          ),

          //Switch
          // Switch(
          //   activeColor: AppTheme.primary,
          //   value: _sliderEnabled,
          //   onChanged: (value) => setState(
          //     () {
          //       _sliderEnabled = value;
          //     },
          //   ),
          // ),

          //Switch List Tile
          SwitchListTile.adaptive(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnabled,
            onChanged: (value) => setState(
              () {
                _sliderEnabled = value;
              },
            ),
          ),

          const AboutListTile(),

          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    'https://static.wikia.nocookie.net/dragonball/images/c/ca/Son_Goku_dise%C3%B1o_DBS_Broly.png/revision/latest?cb=20180831182644&path-prefix=es'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
