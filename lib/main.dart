import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:npd/dao/database.dart';
import 'package:npd/history_screen.dart';
import 'package:npd/model/receipt.dart';
import 'package:npd/settings_screen.dart';
import 'package:npd/view_screen.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:window_size/window_size.dart';
import 'api_npd.dart';
import 'generated/l10n.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'how_use_screen.dart';
import 'inn_screen.dart';
import 'licenses_screen.dart';
import 'model/receipt_id.dart';

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

class NpdApp extends StatefulWidget {

  const NpdApp({Key? key}) : super(key: key);

  @override
  NpdAppState createState() => NpdAppState();

}


class NpdAppState extends State<NpdApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  StreamSubscription? _intentDataStreamSubscription;

  @override
  void initState() {
    super.initState();

    // For sharing or opening urls/text coming from outside the app while the app is in the memory
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
          importReceipt(value).then((receipt){
            if(receipt != null){
              navigatorKey.currentState!.pushNamed("/view/${receipt.inn}/${receipt.receiptId}");
            }
          });
        }, onError: (err) {
          debugPrint("getLinkStream error: $err");
        });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialText().then((String? value) {
      importReceipt(value).then((receipt){
         if(receipt != null){
             navigatorKey.currentState!.pushNamed("/view/${receipt.inn}/${receipt.receiptId}");
          }
      });
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
    final ThemeData theme = ThemeData.from(colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1d3517),
        primary: const Color(0xFF1d3517),
    ));

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
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            secondary: const Color(0xFFf6842c),
            secondaryContainer: const Color(0xFFbd5500),
            onSecondaryContainer: Colors.white,
        ),
      ),
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
        return null;
      },
      navigatorKey: navigatorKey,
    );
  }

  Future<Receipt?> importReceipt(String? url) async {
    if(url == null) return null;
    try {
      final error = ReceiptId.validateUrl(url);
      if(error != null){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString()))
        );
        return null;
      }
      var receipt = await NpdAPI.getFromApi(url);
      await NpdDao.modelReceipt?.insertReceipt(receipt);
      return receipt;
    }catch(error){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString()))
      );
    }
    return null;
  }
}
