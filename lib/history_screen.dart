import 'package:flutter/material.dart';
import 'package:npd/npd_drawer.dart';
import 'generated/l10n.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).menu_history),
        ),
        drawer: const NpdDrawer(),
        body: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: Text(S.of(context).tap_twice),
            ),
            child: const Text('TODO HIS')
        )
    );
  }
}
