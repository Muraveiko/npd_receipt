// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "action_delete_all":
            MessageLookupByLibrary.simpleMessage("Удалить все записи"),
        "action_edit_inn": MessageLookupByLibrary.simpleMessage("ИНН ФИО"),
        "app_name": MessageLookupByLibrary.simpleMessage("Чек НПД"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "fio": MessageLookupByLibrary.simpleMessage("ФИО"),
        "img_desc": MessageLookupByLibrary.simpleMessage("Чек самозанятого"),
        "import_text": MessageLookupByLibrary.simpleMessage("Импорт"),
        "menu_history": MessageLookupByLibrary.simpleMessage("История"),
        "menu_home": MessageLookupByLibrary.simpleMessage("Как пользоваться"),
        "menu_settings": MessageLookupByLibrary.simpleMessage("Настройки"),
        "nag_go_4pda":
            MessageLookupByLibrary.simpleMessage("Задать вопрос на 4PDA"),
        "nav_exit": MessageLookupByLibrary.simpleMessage("Выход"),
        "nav_go_site": MessageLookupByLibrary.simpleMessage("Сайт приложения"),
        "nav_header_desc":
            MessageLookupByLibrary.simpleMessage("Navigation header"),
        "nav_header_subtitle":
            MessageLookupByLibrary.simpleMessage("на термопринтере"),
        "nav_header_title":
            MessageLookupByLibrary.simpleMessage("Печать чека НПД"),
        "nav_other_title": MessageLookupByLibrary.simpleMessage("Прочее"),
        "nav_policy": MessageLookupByLibrary.simpleMessage("Конфидициальность"),
        "nav_share": MessageLookupByLibrary.simpleMessage("Поделиться"),
        "print_image":
            MessageLookupByLibrary.simpleMessage("Печать картинки чека от АПИ"),
        "print_receipt": MessageLookupByLibrary.simpleMessage("Печать чека"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "tap_twice":
            MessageLookupByLibrary.simpleMessage("Для выхода нажмите дважды"),
        "taxomy_inn": MessageLookupByLibrary.simpleMessage("Справочник ИНН"),
        "text_cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "text_check_number": MessageLookupByLibrary.simpleMessage("Чек №"),
        "title_print": MessageLookupByLibrary.simpleMessage("Печать чека"),
        "txt_main_after_import":
            MessageLookupByLibrary.simpleMessage("После импорта первого чека"),
        "txt_main_automation":
            MessageLookupByLibrary.simpleMessage("Автоматизация печати"),
        "txt_main_automation_text": MessageLookupByLibrary.simpleMessage(
            "После настройки внешнего вида чека и получения нужного результата на принтере Вы можете в настройках включить автоматическую печать и закрытие приложения."),
        "txt_main_custom_template": MessageLookupByLibrary.simpleMessage(
            "Настройка внешнего вида чека"),
        "txt_main_delete": MessageLookupByLibrary.simpleMessage("Удаление"),
        "txt_main_delete_text": MessageLookupByLibrary.simpleMessage(
            "Можно удалить все записи в списке по иконке в правом верхнем углу или конкретную, сдвинув ее влево до полного раскрытия фоновой надписи `удалить`."),
        "txt_main_go_to_teplate": MessageLookupByLibrary.simpleMessage(
            "Зайдите в раздел настроек приложения. Секция Шаблон."),
        "txt_main_hope_no_error": MessageLookupByLibrary.simpleMessage(
            "Будем надеяться, что ошибки Вас минуют и после вывода слова `успешно`, программа автоматически перейдет к просмотру чека перед печатью."),
        "txt_main_how_send_to_print":
            MessageLookupByLibrary.simpleMessage("Как отправить на печать"),
        "txt_main_img1": MessageLookupByLibrary.simpleMessage("Вид в плее"),
        "txt_main_img2": MessageLookupByLibrary.simpleMessage(
            "Скриншот из приложения самозянатого"),
        "txt_main_img3": MessageLookupByLibrary.simpleMessage(
            "Выбор приложения через которое отправить"),
        "txt_main_img4":
            MessageLookupByLibrary.simpleMessage("Пример ошибки API"),
        "txt_main_img5": MessageLookupByLibrary.simpleMessage("Ввод ФИО"),
        "txt_main_install_driver": MessageLookupByLibrary.simpleMessage(
            "Установите драйвер термопринтера"),
        "txt_main_instr_rawbt": MessageLookupByLibrary.simpleMessage(
            "Установите и настройте в приложении свой принтер."),
        "txt_main_intro": MessageLookupByLibrary.simpleMessage(
            "По закону все самозанятые обязаны передавать заказчику чеки после оплаты. Чек может быть передан в электронной форме."),
        "txt_main_komu": MessageLookupByLibrary.simpleMessage(
            "Для тех кто решил печатать чеки будет полезна эта программа"),
        "txt_main_my_nalog_send": MessageLookupByLibrary.simpleMessage(
            "Приложение Мой налог позволяет отправить чек покупателю."),
        "txt_main_need_simple_printer": MessageLookupByLibrary.simpleMessage(
            "Чтобы распечатать чек, не нужна касса. Подойдет простой термопринтер. Для печати с телефона удобнее, чтобы подключение было через блютуз. На алиэкспрес такой принтер можно купить за 20–30 долларов."),
        "txt_main_privacy":
            MessageLookupByLibrary.simpleMessage("Приватность данных"),
        "txt_main_privacy_text": MessageLookupByLibrary.simpleMessage(
            "Приложение Чек НПД и драйвер RawBT оперируют данными в пределах вашего телефона и принтера. Доступ к интернету используется только для получения данных от апи налоговой службы."),
        "txt_main_rawbt_it_is": MessageLookupByLibrary.simpleMessage(
            "RawBT - это универсальный драйвер. Изначально драйвер умел печатать на ESC/POS совместимых принтерах. Список поддерживаемых моделей постепенно растет."),
        "txt_main_select_rawbt": MessageLookupByLibrary.simpleMessage(
            "Выберите приложение Чек НПД."),
        "txt_main_start_import_from_api": MessageLookupByLibrary.simpleMessage(
            "Получив ссылку на чек приложение запустит импорт данных в формате json от сервера API налоговой. Мало вероятно, но апи может ответить ошибкой."),
        "txt_main_text_maybe_changed": MessageLookupByLibrary.simpleMessage(
            "Возможно текст поменяют, а пока в случае ошибки апи отвечает устаревшим текстом."),
        "txt_main_why_need_fio": MessageLookupByLibrary.simpleMessage(
            "Введите своё ФИО как на чеке. Этой информации нет в ответе сервера и ее требуется ввести один раз. Если Вы ошиблись, то редактирование доступно через меню трех точек в правом верхнем углу."),
        "txt_main_why_not": MessageLookupByLibrary.simpleMessage(
            "Распечатать качественно картинку чека доступную по ссылке на термопринтере не получается из-за ограничений технологии термопечати. Приложение получает информацию от апи и формирует задание на печать для драйвера, используя команды печати текста и т.д.")
      };
}
