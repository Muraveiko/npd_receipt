import 'package:flutter/material.dart';
import 'package:npd/npd_drawer.dart';
import 'generated/l10n.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HowUseScreen extends StatelessWidget {
  const HowUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).menu_home),
      ),
      drawer: const NpdDrawer(),
      body: DoubleBackToCloseApp(
      snackBar: SnackBar(
        content: Text(S.of(context).tap_twice),
      ),
      child: ListView(
        children: [
          const Image(image: AssetImage('images/npd_pic.webp')),
          TextP(
            text: S.of(context).txt_main_intro,
            style: textTheme.bodyText1!
          ),

          const SizedBox(width: 1,height: 16),
          TextP(
              text: S.of(context).txt_main_komu,
              style: textTheme.titleLarge!
          ),
          TextP(
              text: S.of(context).txt_main_need_simple_printer,
              style: textTheme.bodyText1!
          ),
          TextP(
              text: S.of(context).txt_main_why_not,
              style: textTheme.bodyText1!
          ),

          const SizedBox(width: 1,height: 16),
          TextP(
              text: S.of(context).txt_main_install_driver,
              style: textTheme.titleLarge!
          ),
          const ImageP(image: AssetImage('images/rawbt_play.webp')),
          TextP(
              text: S.of(context).txt_main_rawbt_it_is,
              style: textTheme.bodyText1!
          ),
          TextP(
              text: S.of(context).txt_main_instr_rawbt,
              style: textTheme.bodyText1!
          ),

          const SizedBox(width: 1,height: 16),
          TextP(
              text: S.of(context).txt_main_how_send_to_print,
              style: textTheme.titleLarge!
          ),
          const ImageP(image: AssetImage('images/npd_send_receipt.webp')),
          TextP(
              text: S.of(context).txt_main_my_nalog_send,
              style: textTheme.bodyText1!
          ),
          const ImageP(image: AssetImage('images/select_my.webp')),
          TextP(
              text: S.of(context).txt_main_select_rawbt,
              style: textTheme.bodyText1!
          ),
          TextP(
              text: S.of(context).txt_main_start_import_from_api,
              style: textTheme.bodyText1!
          ),
          const ImageP(image: AssetImage('images/npd_import_error.webp')),
          TextP(
              text: S.of(context).txt_main_text_maybe_changed,
              style: textTheme.bodyText1!
          ),
          TextP(
              text: S.of(context).txt_main_hope_no_error,
              style: textTheme.bodyText1!
          ),

          const SizedBox(width: 1,height: 16),
          TextP(
              text: S.of(context).txt_main_after_import,
              style: textTheme.titleLarge!
          ),
          const ImageP(image: AssetImage('images/input_fio.webp')),
          TextP(
              text: S.of(context).txt_main_why_need_fio,
              style: textTheme.bodyText1!
          ),

          const SizedBox(width: 1,height: 16),
          TextP(
              text: S.of(context).txt_main_custom_template,
              style: textTheme.titleLarge!
          ),
          TextP(
              text: S.of(context).txt_main_go_to_teplate,
              style: textTheme.bodyText1!
          ),

          const SizedBox(width: 1,height: 16),
          TextP(
              text: S.of(context).txt_main_automation,
              style: textTheme.titleLarge!
          ),
          TextP(
              text: S.of(context).txt_main_automation_text,
              style: textTheme.bodyText1!
          ),

          const SizedBox(width: 1,height: 16),
          TextP(
              text: S.of(context).txt_main_delete,
              style: textTheme.titleLarge!
          ),
          TextP(
              text: S.of(context).txt_main_delete_text,
              style: textTheme.bodyText1!
          ),

          const SizedBox(width: 1,height: 16),
          TextP(
              text: S.of(context).txt_main_privacy,
              style: textTheme.titleLarge!
          ),
          TextP(
              text: S.of(context).txt_main_privacy_text,
              style: textTheme.bodyText1!
          ),

          const SizedBox(width: 1,height: 48),
        ],

      )
      ),
    );
  }
}

class TextP extends StatelessWidget {
  const TextP({
    super.key,
    required this.text,
    required this.style,
  });

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: style),
    );
  }
}
class ImageP extends StatelessWidget {
  const ImageP({
    super.key,
    required this.image
  });

  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(image:image),
    );
  }
}