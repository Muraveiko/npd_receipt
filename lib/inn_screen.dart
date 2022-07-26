import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class InnScreen extends StatelessWidget {
  const InnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).taxomy_inn),
        ),
        body:  const Text('TODO просмотр справочника')

    );
  }
}