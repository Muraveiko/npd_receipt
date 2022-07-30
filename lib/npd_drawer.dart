import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'generated/l10n.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';


class NpdDrawer extends StatelessWidget {
  const NpdDrawer({Key? key}) : super(key: key);

  void openExtUrl(context, url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    } catch( e ){
      const snackBar = SnackBar(
             content: Text("BROWSER NOT FOUND"),
            );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);



    return Drawer(
      child: ListView(
        children: [
        SizedBox(
        height: 180.0,
        child: DrawerHeader(
            decoration: const BoxDecoration(color: Colors.orange),
            child: Column(children: [
              const Image(image: AssetImage('assets/images/logo.png'), height: 96),
              const SizedBox(width: 1, height: 4),
              Text(S.of(context).nav_header_title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(S.of(context).nav_header_subtitle,
                style: const TextStyle(color: Colors.white, fontSize:14),
              ),
            ]),
           ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(S.of(context).menu_home),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: Text(S.of(context).menu_history),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/history');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(S.of(context).menu_settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              S.of(context).nav_other_title,
              style: textTheme.bodySmall,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.link),
            title: Text(S.of(context).nav_go_site),
            onTap: () {
              Navigator.pop(context);
              openExtUrl(context, "https://npd-receipt-app.ru/");
            },
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(S.of(context).nag_go_4pda),
            onTap: () {
              Navigator.pop(context);
              openExtUrl(
                  context, "https://4pda.to/forum/index.php?showtopic=1030490");
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: Text(S.of(context).nav_share),
            onTap: () {
              Navigator.pop(context);
              Share.share("https://npd-receipt-app.ru/");
              // todo fix position on macOS
            },
          ),
          ListTile(
            leading: const Icon(Icons.link),
            title: Text(S.of(context).nav_policy),
            onTap: () {
              Navigator.pop(context);
              openExtUrl(context, "https://npd-receipt-app.ru/privacy.html");
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_sharp),
            title: Text(S.of(context).nav_exit),
            onTap: () {
              _closeApp();
            },
          ),
        ],
      ),
    );
  }
}
