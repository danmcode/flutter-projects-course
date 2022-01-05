import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Image(image: AssetImage('assets/landscape.jpg')),
          _Title(),

          // Button Section
          _ButtonSection(),

          //Text description
          _Description(),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        child: const Text(
            'Anim non veniam est Lorem aute consequat dolor fugiat ex et in. Do enim aliquip aliquip velit consectetur aliquip commodo. Magna occaecat minim anim eiusmod ipsum anim incididunt excepteur ex ullamco ipsum.'));
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.red),
          const Text('41'),
        ],
      ),
    );
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _CustomButton(
            iconAction: Icons.call,
            titleAction: 'CALL',
          ),
          _CustomButton(
            iconAction: Icons.location_pin,
            titleAction: 'ROUTE',
          ),
          _CustomButton(
            iconAction: Icons.share,
            titleAction: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final String titleAction;
  final IconData iconAction;

  const _CustomButton({
    Key? key,
    required this.titleAction,
    required this.iconAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconAction,
              color: Colors.blue,
              size: 30,
            )),
        Text(
          titleAction,
          style: const TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}
