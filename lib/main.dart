import 'package:flutter/material.dart';

import 'ui/styles/themes.dart';
import 'ui/views/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Sistema CAE',
      initialRoute: HomeView.routeName,
      routes: {
        HomeView.routeName: (_) => const HomeView(),
      },
      theme: themedatalight
      
    );
  }
}