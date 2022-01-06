import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(
              color: Colors.blue,
              icon: Icons.dashboard,
              text: 'General',
            ),
            _SingleCard(
              color: Colors.deepPurpleAccent,
              icon: Icons.airport_shuttle_rounded,
              text: 'Transport',
            ),
          ],
        ),

        //2
        TableRow(
          children: [
            _SingleCard(
              color: Colors.pinkAccent,
              icon: Icons.shopping_bag,
              text: 'Shopping',
            ),
            _SingleCard(
              color: Colors.orangeAccent,
              icon: Icons.money,
              text: 'bills',
            ),
          ],
        ),

        //3
        TableRow(
          children: [
            _SingleCard(
              color: Colors.blueAccent,
              icon: Icons.movie_creation,
              text: 'Entertaiment',
            ),
            _SingleCard(
              color: Colors.greenAccent,
              icon: Icons.catching_pokemon_rounded,
              text: 'Grocery',
            ),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  //Parametros
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon),
          radius: 30,
        ),
        const SizedBox(height: 15),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: color,
          ),
        ),
      ],
    ));
  }
}

class _CardBackground extends StatelessWidget {
  const _CardBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Column child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
