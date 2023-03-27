import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
            const SwitchDarkMode(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              const Text("Inglés"),
              Switch(
                value: false,
                 onChanged: (value) {},
              ),
              const Text("Español"),

            ],)
          ],
        ),
      ),
    );
  }
}

class SwitchDarkMode extends StatefulWidget {
  const SwitchDarkMode({super.key});

  @override
  State<SwitchDarkMode> createState() => _SwitchDarkModeState();
}

class _SwitchDarkModeState extends State<SwitchDarkMode> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const  Text("Modo oscuro"),
      // This bool value toggles the switch.
      value: light,
      
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}