import 'package:cae/generated/l10n.dart';
import 'package:cae/settings/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings/setting_services.dart';
import '../../settings/theme_provider.dart';

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
              children: const [
                Text("Inglés"),
                SwitchLanguage(),
                Text("Español"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SwitchLanguage extends StatefulWidget {
  const SwitchLanguage({
    super.key,
  });

  @override
  State<SwitchLanguage> createState() => _SwitchLanguageState();
}

class _SwitchLanguageState extends State<SwitchLanguage> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Preferencias.getIsEnglish,
      onChanged: (value) {
        Preferencias.setIsEnglish = value;
        final langprovider = Provider.of<LanguageProvider>(context, listen: false);
        value ? langprovider.setSpanish() : langprovider.setEnglish();
        setState(() {});
      },
    );
  }
}

class SwitchDarkMode extends StatefulWidget {
  const SwitchDarkMode({super.key});

  @override
  State<SwitchDarkMode> createState() => _SwitchDarkModeState();
}

class _SwitchDarkModeState extends State<SwitchDarkMode> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        value: Preferencias.getIsDarkMode,
        title: Text(S.current.DarkMode.toString()),
        onChanged: (value) {
          Preferencias.setIsdarkmode = value;
          final themeprovider = Provider.of<ThemeProvider>(context, listen: false);
          value ? themeprovider.setDarkMode() : themeprovider.setlightMode();
          setState(() {});
        });
  }
}
