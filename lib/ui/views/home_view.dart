import 'package:cae/logic/main_provider.dart';
import 'package:cae/modules/calcules/views/calcules_view.dart';
import 'package:cae/modules/extras/views/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../modules/alarms/views/alarm_view.dart';
import '../widgets/drawer.dart';

class HomeView extends StatelessWidget {
  static String routeName = 'home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainprovider = Provider.of<Mainprovider>(context);
    final indiceactual = mainprovider.selectedMenuOption;
    const List<Widget> widgetOptions = <Widget>[
    AlarmsView(),
    CalculosView(),
    TodoView(),
  ];
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
          title: Text(S.current.Home.toString()),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor),
          body:  widgetOptions.elementAt(indiceactual),
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
 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
     
    ),
    Text(
      'Index 1: Business',
      
    ),
    Text(
      'Index 2: School',
    
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


