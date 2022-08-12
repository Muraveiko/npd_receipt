import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:npd/dao/database.dart';
import 'package:npd/history_screen.dart';
import 'package:npd/settings_screen.dart';
import 'package:npd/view_screen.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:window_size/window_size.dart';
import 'generated/l10n.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'how_use_screen.dart';
import 'import_screen.dart';
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

    // For sharing or opening urls/text coming from outside the app while the app is closed
    final importUrl = await ReceiveSharingIntent.getInitialText() ?? '';

    runApp(NpdApp(importUrl));
}

class NpdApp extends StatefulWidget {
  String importUrl;
  NpdApp(this.importUrl,{Key? key}) : super(key: key);

  @override
  NpdAppState createState() => NpdAppState();

}


class NpdAppState extends State<NpdApp> {
  StreamSubscription? _intentDataStreamSubscription;


  @override
  void initState() {
    super.initState();

    // For sharing or opening urls/text coming from outside the app while the app is in the memory
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((value){
           setState(() {
             widget.importUrl = value;
           });
          }, onError: (err) {
            debugPrint("getLinkStream error: $err");
        });

  }

  @override
  void dispose() {
    _intentDataStreamSubscription?.cancel();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    ThemeData theme = ThemeData.from(colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1d3517),
      primary: const Color(0xFF1d3517),
    ));
    theme = theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        secondary: const Color(0xFFf6842c),
        secondaryContainer: const Color(0xFFbd5500),
        onSecondaryContainer: Colors.white,
      ),
    );

    // для обработки "Поделиться"

    if (widget.importUrl.length>5){
      return MaterialApp(
        key: Key("import${widget.importUrl}"),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        onGenerateTitle: (context) => S.of(context).app_name,
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: ImportScreen(widget.importUrl),
      );
   }

    // обычный запуск

    return MaterialApp(
      key: const Key("normal"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (context) => S.of(context).app_name,
      // вариант локализованного заголовка
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: {
         '/': (context) =>  const HowUseScreen() ,
          '/history': (context) => const HistoryScreen(),
          '/settings': (context) => const NpdSettingsScreen(),
          '/inn': (context) => const InnScreen(),
          '/licenses': (context) => const LicensesScreen(),
      },
      onGenerateRoute: (routeSettings) {
        var path = routeSettings.name?.split('/');
        if (path?[1] == 'view') {
          return MaterialPageRoute(
              builder: (context) => ViewScreen(path![2], path[3]),
              settings: routeSettings
          );
        }
        return null;
      },
    );

  }


}
