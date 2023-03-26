import 'package:cae/ui/logic/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  static String routeName = 'home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainprovider = Provider.of<Mainprovider>(context);
    final indiceactual = mainprovider.selectedMenuOption;
    return Scaffold(
      appBar: AppBar(
          title: Text(S.current.Home.toString()),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor),
      bottomNavigationBar: BottomNavigationBar(
        items:  [
          BottomNavigationBarItem(icon: const Icon(Icons.calculate), label: S.current.Calculations.toString()),
          BottomNavigationBarItem(icon: const Icon(Icons.alarm_add_rounded), label: S.current.Alarms.toString()),
          BottomNavigationBarItem(icon: const Icon(Icons.integration_instructions_sharp), label: S.current.Extras.toString()),

        ],
        onTap: (i) => mainprovider.selectedMenuOpt =  i,
        currentIndex: indiceactual
      ),
    );
  }
}
