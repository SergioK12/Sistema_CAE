import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class HomeView extends StatelessWidget {
    static String routeName = 'home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.home.toString()),
        centerTitle: true,
        backgroundColor:Theme.of(context).primaryColor
      ),
    );
  }
}
