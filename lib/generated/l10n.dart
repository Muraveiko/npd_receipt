// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Чек НПД`
  String get app_name {
    return Intl.message(
      'Чек НПД',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Печать чека НПД`
  String get nav_header_title {
    return Intl.message(
      'Печать чека НПД',
      name: 'nav_header_title',
      desc: '',
      args: [],
    );
  }

  /// `на термопринтере`
  String get nav_header_subtitle {
    return Intl.message(
      'на термопринтере',
      name: 'nav_header_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Navigation header`
  String get nav_header_desc {
    return Intl.message(
      'Navigation header',
      name: 'nav_header_desc',
      desc: '',
      args: [],
    );
  }

  /// `Как пользоваться`
  String get menu_home {
    return Intl.message(
      'Как пользоваться',
      name: 'menu_home',
      desc: '',
      args: [],
    );
  }

  /// `История`
  String get menu_history {
    return Intl.message(
      'История',
      name: 'menu_history',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get menu_settings {
    return Intl.message(
      'Настройки',
      name: 'menu_settings',
      desc: '',
      args: [],
    );
  }

  /// `Печать чека`
  String get title_print {
    return Intl.message(
      'Печать чека',
      name: 'title_print',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message(
      'Удалить',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Удалить все записи`
  String get action_delete_all {
    return Intl.message(
      'Удалить все записи',
      name: 'action_delete_all',
      desc: '',
      args: [],
    );
  }

  /// `Импорт`
  String get import_text {
    return Intl.message(
      'Импорт',
      name: 'import_text',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get text_cancel {
    return Intl.message(
      'Отмена',
      name: 'text_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Чек №`
  String get text_check_number {
    return Intl.message(
      'Чек №',
      name: 'text_check_number',
      desc: '',
      args: [],
    );
  }

  /// `Справочник ИНН`
  String get taxomy_inn {
    return Intl.message(
      'Справочник ИНН',
      name: 'taxomy_inn',
      desc: '',
      args: [],
    );
  }

  /// `Печать чека`
  String get print_receipt {
    return Intl.message(
      'Печать чека',
      name: 'print_receipt',
      desc: '',
      args: [],
    );
  }

  /// `Чек самозанятого`
  String get img_desc {
    return Intl.message(
      'Чек самозанятого',
      name: 'img_desc',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `ФИО`
  String get fio {
    return Intl.message(
      'ФИО',
      name: 'fio',
      desc: '',
      args: [],
    );
  }

  /// `ИНН ФИО`
  String get action_edit_inn {
    return Intl.message(
      'ИНН ФИО',
      name: 'action_edit_inn',
      desc: '',
      args: [],
    );
  }

  /// `Печать картинки чека от АПИ`
  String get print_image {
    return Intl.message(
      'Печать картинки чека от АПИ',
      name: 'print_image',
      desc: '',
      args: [],
    );
  }

  /// `По закону все самозанятые обязаны передавать заказчику чеки после оплаты. Чек может быть передан в электронной форме.`
  String get txt_main_intro {
    return Intl.message(
      'По закону все самозанятые обязаны передавать заказчику чеки после оплаты. Чек может быть передан в электронной форме.',
      name: 'txt_main_intro',
      desc: '',
      args: [],
    );
  }

  /// `Для тех кто решил печатать чеки будет полезна эта программа`
  String get txt_main_komu {
    return Intl.message(
      'Для тех кто решил печатать чеки будет полезна эта программа',
      name: 'txt_main_komu',
      desc: '',
      args: [],
    );
  }

  /// `Чтобы распечатать чек, не нужна касса. Подойдет простой термопринтер. Для печати с телефона удобнее, чтобы подключение было через блютуз. На алиэкспрес такой принтер можно купить за 20–30 долларов.`
  String get txt_main_need_simple_printer {
    return Intl.message(
      'Чтобы распечатать чек, не нужна касса. Подойдет простой термопринтер. Для печати с телефона удобнее, чтобы подключение было через блютуз. На алиэкспрес такой принтер можно купить за 20–30 долларов.',
      name: 'txt_main_need_simple_printer',
      desc: '',
      args: [],
    );
  }

  /// `Распечатать качественно картинку чека доступную по ссылке на термопринтере не получается из-за ограничений технологии термопечати. Приложение получает информацию от апи и формирует задание на печать для драйвера, используя команды печати текста и т.д.`
  String get txt_main_why_not {
    return Intl.message(
      'Распечатать качественно картинку чека доступную по ссылке на термопринтере не получается из-за ограничений технологии термопечати. Приложение получает информацию от апи и формирует задание на печать для драйвера, используя команды печати текста и т.д.',
      name: 'txt_main_why_not',
      desc: '',
      args: [],
    );
  }

  /// `Установите драйвер термопринтера`
  String get txt_main_install_driver {
    return Intl.message(
      'Установите драйвер термопринтера',
      name: 'txt_main_install_driver',
      desc: '',
      args: [],
    );
  }

  /// `Вид в плее`
  String get txt_main_img1 {
    return Intl.message(
      'Вид в плее',
      name: 'txt_main_img1',
      desc: '',
      args: [],
    );
  }

  /// `RawBT - это универсальный драйвер. Изначально драйвер умел печатать на ESC/POS совместимых принтерах. Список поддерживаемых моделей постепенно растет.`
  String get txt_main_rawbt_it_is {
    return Intl.message(
      'RawBT - это универсальный драйвер. Изначально драйвер умел печатать на ESC/POS совместимых принтерах. Список поддерживаемых моделей постепенно растет.',
      name: 'txt_main_rawbt_it_is',
      desc: '',
      args: [],
    );
  }

  /// `Установите и настройте в приложении свой принтер.`
  String get txt_main_instr_rawbt {
    return Intl.message(
      'Установите и настройте в приложении свой принтер.',
      name: 'txt_main_instr_rawbt',
      desc: '',
      args: [],
    );
  }

  /// `Как отправить на печать`
  String get txt_main_how_send_to_print {
    return Intl.message(
      'Как отправить на печать',
      name: 'txt_main_how_send_to_print',
      desc: '',
      args: [],
    );
  }

  /// `Скриншот из приложения самозянатого`
  String get txt_main_img2 {
    return Intl.message(
      'Скриншот из приложения самозянатого',
      name: 'txt_main_img2',
      desc: '',
      args: [],
    );
  }

  /// `Приложение Мой налог позволяет отправить чек покупателю.`
  String get txt_main_my_nalog_send {
    return Intl.message(
      'Приложение Мой налог позволяет отправить чек покупателю.',
      name: 'txt_main_my_nalog_send',
      desc: '',
      args: [],
    );
  }

  /// `Выбор приложения через которое отправить`
  String get txt_main_img3 {
    return Intl.message(
      'Выбор приложения через которое отправить',
      name: 'txt_main_img3',
      desc: '',
      args: [],
    );
  }

  /// `Получив ссылку на чек приложение запустит импорт данных в формате json от сервера API налоговой. Мало вероятно, но апи может ответить ошибкой.`
  String get txt_main_start_import_from_api {
    return Intl.message(
      'Получив ссылку на чек приложение запустит импорт данных в формате json от сервера API налоговой. Мало вероятно, но апи может ответить ошибкой.',
      name: 'txt_main_start_import_from_api',
      desc: '',
      args: [],
    );
  }

  /// `Выберите приложение Чек НПД.`
  String get txt_main_select_rawbt {
    return Intl.message(
      'Выберите приложение Чек НПД.',
      name: 'txt_main_select_rawbt',
      desc: '',
      args: [],
    );
  }

  /// `Пример ошибки API`
  String get txt_main_img4 {
    return Intl.message(
      'Пример ошибки API',
      name: 'txt_main_img4',
      desc: '',
      args: [],
    );
  }

  /// `Возможно текст поменяют, а пока в случае ошибки апи отвечает устаревшим текстом.`
  String get txt_main_text_maybe_changed {
    return Intl.message(
      'Возможно текст поменяют, а пока в случае ошибки апи отвечает устаревшим текстом.',
      name: 'txt_main_text_maybe_changed',
      desc: '',
      args: [],
    );
  }

  /// `Будем надеяться, что ошибки Вас минуют и после вывода слова 'успешно', программа автоматически перейдет к просмотру чека перед печатью.`
  String get txt_main_hope_no_error {
    return Intl.message(
      'Будем надеяться, что ошибки Вас минуют и после вывода слова `успешно`, программа автоматически перейдет к просмотру чека перед печатью.',
      name: 'txt_main_hope_no_error',
      desc: '',
      args: [],
    );
  }

  /// `После импорта первого чека`
  String get txt_main_after_import {
    return Intl.message(
      'После импорта первого чека',
      name: 'txt_main_after_import',
      desc: '',
      args: [],
    );
  }

  /// `Ввод ФИО`
  String get txt_main_img5 {
    return Intl.message(
      'Ввод ФИО',
      name: 'txt_main_img5',
      desc: '',
      args: [],
    );
  }

  /// `Введите своё ФИО как на чеке. Этой информации нет в ответе сервера и ее требуется ввести один раз. Если Вы ошиблись, то редактирование доступно через меню трех точек в правом верхнем углу.`
  String get txt_main_why_need_fio {
    return Intl.message(
      'Введите своё ФИО как на чеке. Этой информации нет в ответе сервера и ее требуется ввести один раз. Если Вы ошиблись, то редактирование доступно через меню трех точек в правом верхнем углу.',
      name: 'txt_main_why_need_fio',
      desc: '',
      args: [],
    );
  }

  /// `Настройка внешнего вида чека`
  String get txt_main_custom_template {
    return Intl.message(
      'Настройка внешнего вида чека',
      name: 'txt_main_custom_template',
      desc: '',
      args: [],
    );
  }

  /// `Зайдите в раздел настроек приложения. Секция Шаблон.`
  String get txt_main_go_to_teplate {
    return Intl.message(
      'Зайдите в раздел настроек приложения. Секция Шаблон.',
      name: 'txt_main_go_to_teplate',
      desc: '',
      args: [],
    );
  }

  /// `Автоматизация печати`
  String get txt_main_automation {
    return Intl.message(
      'Автоматизация печати',
      name: 'txt_main_automation',
      desc: '',
      args: [],
    );
  }

  /// `После настройки внешнего вида чека и получения нужного результата на принтере Вы можете в настройках включить автоматическую печать и закрытие приложения.`
  String get txt_main_automation_text {
    return Intl.message(
      'После настройки внешнего вида чека и получения нужного результата на принтере Вы можете в настройках включить автоматическую печать и закрытие приложения.',
      name: 'txt_main_automation_text',
      desc: '',
      args: [],
    );
  }

  /// `Удаление`
  String get txt_main_delete {
    return Intl.message(
      'Удаление',
      name: 'txt_main_delete',
      desc: '',
      args: [],
    );
  }

  /// `Можно удалить все записи в списке по иконке в правом верхнем углу или конкретную, сдвинув ее влево до полного раскрытия фоновой надписи 'удалить'.`
  String get txt_main_delete_text {
    return Intl.message(
      'Можно удалить все записи в списке по иконке в правом верхнем углу или конкретную, сдвинув ее влево до полного раскрытия фоновой надписи `удалить`.',
      name: 'txt_main_delete_text',
      desc: '',
      args: [],
    );
  }

  /// `Приватность данных`
  String get txt_main_privacy {
    return Intl.message(
      'Приватность данных',
      name: 'txt_main_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Приложение Чек НПД и драйвер RawBT оперируют данными в пределах вашего телефона и принтера. Доступ к интернету используется только для получения данных от апи налоговой службы.`
  String get txt_main_privacy_text {
    return Intl.message(
      'Приложение Чек НПД и драйвер RawBT оперируют данными в пределах вашего телефона и принтера. Доступ к интернету используется только для получения данных от апи налоговой службы.',
      name: 'txt_main_privacy_text',
      desc: '',
      args: [],
    );
  }

  /// `Прочее`
  String get nav_other_title {
    return Intl.message(
      'Прочее',
      name: 'nav_other_title',
      desc: '',
      args: [],
    );
  }

  /// `Сайт приложения`
  String get nav_go_site {
    return Intl.message(
      'Сайт приложения',
      name: 'nav_go_site',
      desc: '',
      args: [],
    );
  }

  /// `Задать вопрос на 4PDA`
  String get nag_go_4pda {
    return Intl.message(
      'Задать вопрос на 4PDA',
      name: 'nag_go_4pda',
      desc: '',
      args: [],
    );
  }

  /// `Поделиться`
  String get nav_share {
    return Intl.message(
      'Поделиться',
      name: 'nav_share',
      desc: '',
      args: [],
    );
  }

  /// `Конфидициальность`
  String get nav_policy {
    return Intl.message(
      'Конфидициальность',
      name: 'nav_policy',
      desc: '',
      args: [],
    );
  }

  /// `Выход`
  String get nav_exit {
    return Intl.message(
      'Выход',
      name: 'nav_exit',
      desc: '',
      args: [],
    );
  }

  /// `Для выхода нажмите дважды`
  String get tap_twice {
    return Intl.message(
      'Для выхода нажмите дважды',
      name: 'tap_twice',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
