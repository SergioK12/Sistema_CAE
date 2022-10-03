import 'package:adaptive_navigation/adaptive_navigation.dart';
import 'package:flutter/material.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;

  changeDestination(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _destinations = const <AdaptiveScaffoldDestination>[
    AdaptiveScaffoldDestination(
      title: " Home ",
      icon: Icons.home,
    ),
    AdaptiveScaffoldDestination(title: " Call ", icon: Icons.call),
    AdaptiveScaffoldDestination(title: " Mail ", icon: Icons.mail),
  ];

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigationScaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(
            12.0, //Lado izquierdo
            30.0, //Arriba
            12.0, //Derecho
            12.0, //Abajo
          ),
          child: Container(
            color: Colors.red,
          ),
        ),
        selectedIndex: _selectedIndex,
        onDestinationSelected: changeDestination,
        destinations: _destinations);
  }
}
