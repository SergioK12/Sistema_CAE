import 'package:flutter/material.dart';

import 'generated/l10n.dart';
import 'ui/styles/themes.dart';
import 'ui/views/home_view.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema CAE',
      theme: themedatalight,
      initialRoute: HomeView.routeName,
      routes: {
        HomeView.routeName: (_) => const HomeView(),
      },
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
    Locale('en'), // English
    Locale('es'), // Spanish
  ],
    );
  }
}
