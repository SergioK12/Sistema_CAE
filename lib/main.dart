
import 'package:cae/modules/extras/models/task_model.dart';
import 'package:cae/modules/extras/providers/add_task_provider.dart';
import 'package:cae/modules/settings/language_provider.dart';
import 'package:cae/modules/settings/setting_services.dart';
import 'package:cae/modules/settings/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'logic/main_provider.dart';
import 'ui/views/home_view.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());

  await Preferencias.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: ((context) => LanguageProvider(isEnglish: Preferencias.getIsEnglish))),
      ChangeNotifierProvider(
        create: (context) =>ThemeProvider(isDarkMode: Preferencias.getIsDarkMode),
      ),
      
      ChangeNotifierProvider(
        create: (context) =>TaskFormProvider()),
      
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Mainprovider()),
        ],
        child: MaterialApp(
          title: 'Sistema CAE',
          theme: Provider.of<ThemeProvider>(context).temaactual,
          initialRoute: HomeView.routeName,
          routes: {
            HomeView.routeName: (_) => const HomeView(),
          },
          locale: Provider.of<LanguageProvider>(context).langActual,
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
        ));
  }
}
