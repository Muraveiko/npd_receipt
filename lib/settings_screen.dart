import 'package:flutter/material.dart';
import 'package:npd/npd_drawer.dart';
import 'generated/l10n.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).menu_settings),
        ),
        drawer: const NpdDrawer(),
        body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: Text(S.of(context).tap_twice),
            ),
            child: const Text('TODO SET')
        )
    );
  }
}
