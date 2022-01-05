import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.pink,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Calendario',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stacked_bar_chart),
          label: 'Gráfica',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Usuarios',
        ),
      ],
    );
  }
}
