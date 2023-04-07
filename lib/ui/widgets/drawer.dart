import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings/setting_services.dart';
import '../../settings/settings_provider.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({super.key});

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              ],
            )
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
    return SwitchListTile.adaptive(
        value: Preferencias.getIsDarkMode,
        title: const Text("Modo odcuro"),
        onChanged: (value) {
          Preferencias.setIsdarkmode = value;
          final themeprovider =
              Provider.of<ThemeProvider>(context, listen: false);
          value ? themeprovider.setDarkMode() : themeprovider.setlightMode();
          setState(() {});
        });
  }
}
