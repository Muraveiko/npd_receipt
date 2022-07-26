import 'package:flutter/material.dart';
import 'package:npd/npd_drawer.dart';
import 'generated/l10n.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'inn_screen.dart';

class NpdSettingsScreen extends StatefulWidget {
  const NpdSettingsScreen({Key? key}) : super(key: key);

  @override
  NpdSettingsScreenState createState() => NpdSettingsScreenState();
}

class NpdSettingsScreenState extends State<NpdSettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return SettingsScreen(
      title: S.of(context).menu_settings,
      children: [
        SimpleSettingsTile(
          title: 'ИНН',
          subtitle: 'Просмотр справочника ИНН',
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InnScreen(),)),
        ),
        SettingsGroup(
          title: 'Печать чека',
          subtitle: 'Настройки автоматизации',
          children: <Widget>[
            SwitchSettingsTile(
              settingKey: 'autoStart',
              title: 'Печать',
              defaultValue: false,
              enabledLabel: 'автоматически',
              disabledLabel: 'по команде пользователя',
              onChange: (value) {
                debugPrint('autoStart: $value');
              },
            ),

            SimpleSettingsTile(
              title: 'TODO Для андроид 12',
              subtitle: 'нужные дополнительные действия',
            ),

            DropDownSettingsTile<int>(
              title: 'Количество копий',
              settingKey: 'copies',
              values: const <int, String>{
                1: '1 экземпляр',
                2: '2 экземпляра',
                3: '3 экземпляра',
                4: '4 экземпляра',
                5: '5 экземпляров',
              },
              selected: 1,
              onChange: (value) {
                debugPrint('copies: $value');
              },
            ),

            SwitchSettingsTile(
              settingKey: 'autoClose',
              title: 'Автозакрытие',
              defaultValue: true,
              enabledLabel: 'Завершать приложение после печати',
              disabledLabel: 'не делать',
              onChange: (value) {
                debugPrint('autoClose: $value');
              },
            ),
          ]
        ),
        SettingsGroup(
          title: 'Шаблон',
          subtitle: 'Настройка внешнего вида чека',
          children: <Widget>[
            SwitchSettingsTile(
              settingKey: 'height2Number',
              title: 'Номер чека',
              defaultValue: true,
              enabledLabel: 'Двойная высота строки',
              disabledLabel: 'Одинарная высота строки',
              onChange: (value) {
                debugPrint('height2Number: $value');
              },
            ),


            RadioModalSettingsTile<String>(
              title: 'Символ для линий',
              settingKey: 'delimiterChar',
              values: const <String, String>{
                '.':'точка',
                '·':'точка по середине',
                '•':'маркер (bullet)',
                '-':'минус',
                '―':'горизонтальная линия',
                '=':'знак равно',
                '═':'двойная линия',
                '*':'звёздочка',
                ' ':'пустая строка',
              },
              selected: '-',
              onChange: (value) {
                debugPrint('delimiterChar: $value');
              },
            ),

            SwitchSettingsTile(
              settingKey: 'profession',
              title: 'Печатать профессиию',
              defaultValue: true,
              enabledLabel: 'если указана',
              disabledLabel: 'никогда',
              onChange: (value) {
                debugPrint('profession: $value');
              },
              childrenIfEnabled: <Widget>[
                  SwitchSettingsTile(
                    settingKey: 'small_font_for_prof',
                    title: 'мелким шрифтом',
                    defaultValue: true,
                    enabledLabel: 'профессия печатается мельче',
                    disabledLabel: 'профессия обычным шрифтом',
                    onChange: (value) {
                      debugPrint('small_font_for_prof: $value');
                    },
                  ),
                ],

            ),

            SwitchSettingsTile(
              settingKey: 'innInHead',
              title: 'Реквизиты самозанятого',
              defaultValue: false,
              enabledLabel: 'ИНН,НПД,ТЕЛ,ЕМАЙЛ в ШАПКЕ',
              disabledLabel: 'ИНН,НПД,ТЕЛ,ЕМАЙЛ после ИТОГО',
              onChange: (value) {
                debugPrint('innInHead: $value');
              },
            ),
            SwitchSettingsTile(
              settingKey: 'phone',
              title: 'Номер телефона',
              defaultValue: true,
              enabledLabel: 'если указан',
              disabledLabel: 'никогда',
              onChange: (value) {
                debugPrint('phone: $value');
              },
            ),
            SwitchSettingsTile(
              settingKey: 'email',
              title: 'Email',
              defaultValue: true,
              enabledLabel: 'если указан',
              disabledLabel: 'никогда',
              onChange: (value) {
                debugPrint('email: $value');
              },
            ),

            RadioModalSettingsTile<String>(
              title: 'Символ линии ИТОГО',
              settingKey: 'delimiterAmountChar',
              values: const <String, String>{
                '.':'точка',
                '·':'точка по середине',
                '•':'маркер (bullet)',
                '-':'минус',
                '―':'горизонтальная линия',
                '=':'знак равно',
                '═':'двойная линия',
                '*':'звёздочка',
                ' ':'пустая строка',
              },
              selected: '=',
              onChange: (value) {
                debugPrint('delimiterAmountChar: $value');
              },
            ),

            SwitchSettingsTile(
              settingKey: 'printClientName',
              title: 'Наименование покупателя',
              defaultValue: false,
              enabledLabel: 'Ниже ИНН вывести наименование',
              disabledLabel: 'не печатать',
              onChange: (value) {
                debugPrint('printClientName: $value');
              },
            ),

             SliderSettingsTile(
               title: 'Размер QR-code',
               subtitle: 'Множитель размера от 1 до 20',
               settingKey: 'qr_size',
               defaultValue: 6,
               min: 1,
               max: 20,
               step: 1,
               onChange: (value) {
                    debugPrint('qr_size: $value');
               },
             ),
          ],
        ),
        SettingsGroup(
          title: 'Прочее',
          children: <Widget>[
            SimpleSettingsTile(
              title: 'Open-source',
              subtitle: 'Лицензии использованного программного обеспечения',
              onTap: () => showLicensePage(
                  context: context,
                  applicationName: S.of(context).app_name,
                  applicationIcon: const Image(image: AssetImage('images/logo.png'), height: 128),
              ),
            ),
            SimpleSettingsTile(
              title: 'Графика',
              subtitle: 'Лицензии использованных графических изображений',
              onTap: () => debugPrint('Графика'),
            ),
            SimpleSettingsTile(
              title: 'Версия приложения',
              subtitle: 'x.x.x',
              enabled: false,
            ),
          ]
        ),
       ],
    );
  }


}
