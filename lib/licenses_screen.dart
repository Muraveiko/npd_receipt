import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LicensesScreen extends StatelessWidget {
  const LicensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    final linkStyle = TextStyle(color: Theme.of(context).primaryColor);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Лицензии изображений'),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8.0,16.0,8.0,8.0),
          child: ListView(children: [
            Text('Иконка приложения', style: textTheme.titleLarge!),
            const SizedBox(
              width: 1,
              height: 8,
            ),
            Text('Free Icons > Free Large Boss Icon Set',
                style: textTheme.bodyText1!),
            Text('Author: Aha-Soft',
                style: textTheme.bodyText1!),
            Text('Default license: Linkware (Backlink to http://www.aha-soft.com required)',
                style: textTheme.bodyText1!),
            Text('Commercial usage: Allowed',
                style: textTheme.bodyText1!),
            InkWell(
                child: Text('Free for public use with a link to http://www.aha-soft.com',style: linkStyle),
                onTap: () => launchUrl(Uri.parse('http://www.aha-soft.com'))
            ),


            const SizedBox(
              width: 1,
              height: 32,
            ),
            Text('Графические элементы', style: textTheme.titleLarge!),
            const SizedBox(
              width: 1,
              height: 8,
            ),
            Text('Clock, deadline, hourglass, timer, wait icon',
                style: textTheme.bodyText1!),
            Text('Author: Julia Osadcha (https://www.iconfinder.com/Juliia_Os)',
                style: textTheme.bodyText1!),

            const SizedBox(
              width: 1,
              height: 32,
            ),
            Text('Набор иконок приложения', style: textTheme.titleLarge!),
            const SizedBox(
              width: 1,
              height: 8,
            ),
            Text('Icons. Material design',
                style: textTheme.bodyText1!),
            Text('Apache License Version 2.0',
                style: textTheme.bodyText1!),

            const SizedBox(
              width: 1,
              height: 32,
            ),
          ]),
        ));
  }
}
