import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:npd/dao/database.dart';
import 'package:npd/history_screen.dart';
import 'package:npd/settings_screen.dart';
import 'package:npd/view_screen.dart';
import 'package:window_size/window_size.dart';
import 'generated/l10n.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'how_use_screen.dart';
import 'inn_screen.dart';
import 'licenses_screen.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();


    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowTitle('Чек НПД');
      setWindowMinSize(const Size(320, 480));
      setWindowMaxSize(const Size(640, 1024));
      setWindowFrame(const Rect.fromLTRB(100.0, 100.0, 580.0, 900.0));
    }

     await Settings.init(
       cacheProvider: SharePreferenceCache(),
     );
     await NpdDao.init();

     runApp(const NpdApp());
}



class NpdApp extends StatelessWidget {
  const NpdApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (context) => S.of(context).app_name,  // вариант локализованного заголовка
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: const Color(0xff001000),
          primaryIconTheme: const IconThemeData(color: Colors.black),
          primaryTextTheme:
              const TextTheme(bodyText1: TextStyle(color: Colors.black)),
          textTheme:
              const TextTheme(bodyText1: TextStyle(color: Color(0xff001000)))),
      initialRoute: '/',
      routes: {
        '/': (context) => const HowUseScreen(),
        '/history': (context) => const HistoryScreen(),
        '/settings': (context) => const NpdSettingsScreen(),
        '/inn': (context) => const InnScreen(),
        '/licenses': (context) => const LicensesScreen(),
      },
      onGenerateRoute: (routeSettings) {
        var path = routeSettings.name?.split('/');
        if(path?[1] == 'view'){
          return MaterialPageRoute(
              builder: (context) => ViewScreen(path![2],path[3]),
              settings: routeSettings
          );
        }
      },
    );
  }
}
