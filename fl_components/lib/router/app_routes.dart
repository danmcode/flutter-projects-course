import 'package:flutter/material.dart';

import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    // MenuOption(
    //   route: 'home',
    //   icon: Icons.home,
    //   name: 'Home Screen',
    //   screen: const HomeScreen(),
    // ),

    MenuOption(
      route: 'listview1',
      icon: Icons.list,
      name: 'List View 1',
      screen: const ListView1Screen(),
    ),

    MenuOption(
      route: 'listview2',
      icon: Icons.list,
      name: 'List View 2',
      screen: const ListView2Screen(),
    ),

    MenuOption(
      route: 'alert',
      icon: Icons.notifications,
      name: 'Alertas - Alerts',
      screen: const AlertScreen(),
    ),

    MenuOption(
      route: 'card',
      icon: Icons.credit_card,
      name: 'Cards',
      screen: const CardScreen(),
    ),

    MenuOption(
      route: 'avatar',
      icon: Icons.supervised_user_circle_outlined,
      name: 'Circle avatar',
      screen: const AvatarScreen(),
    ),

    MenuOption(
      route: 'animated',
      icon: Icons.play_circle_outline,
      name: 'Animated Container',
      screen: const AnimatedScreen(),
    ),

    MenuOption(
      route: 'inputs',
      icon: Icons.input_rounded,
      name: 'Text Inputs',
      screen: const InputsScreen(),
    ),

    MenuOption(
      route: 'slider',
      icon: Icons.sailing_outlined,
      name: 'Sliders and checks',
      screen: const SliderScreen(),
    ),

    MenuOption(
      route: 'listviewbuilder',
      icon: Icons.build_circle_outlined,
      name: 'InfiniteScroll & Pull to refresh',
      screen: const ListViewBuilderScreen(),
    ),
  ];

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (BuildContext context) => const HomeScreen(),
  //   'listview1': (BuildContext context) => const ListView1Screen(),
  //   'listview2': (BuildContext context) => const ListView2Screen(),
  //   'alert': (BuildContext context) => const AlertScreen(),
  //   'card': (BuildContext context) => const CardScreen(),
  // };

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({
      'home': (BuildContext context) => const HomeScreen(),
    });
    for (final option in menuOptions) {
      appRoutes.addAll({
        option.route: (BuildContext context) => option.screen,
      });
    }

    return appRoutes;
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
