import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        children: const [
          CustomCardType1(),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/8/86/Landscape_mountain.jpg',
            name: 'Un hermoso paisaje',
          ),
          CustomCardType2(
            imageUrl:
                'https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1.jpg',
            name: 'Quiero ir ahi',
          ),
          CustomCardType2(
            imageUrl:
                'https://photographylife.com/wp-content/uploads/2020/03/Dan-Ballard-Landscapes-6.jpg',
          ),
        ],
      ),
    );
  }
}
