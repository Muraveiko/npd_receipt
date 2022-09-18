import 'IRawbtCommand.dart';

import '../attributes/AttributesBarcode.dart';

class CommandBarcode implements IRawbtCommand {
  final String command = "barcode";

  final String data;
  final String type;

  final String hri;
  final int font;
  final int height;
  final int width;

  final String alignment;

  CommandBarcode(this.data, AttributesBarcode attr):
        type = attr.type,
        hri = attr.hri,
        font = attr.font,
        height = attr.height,
        width = attr.width,
        alignment = attr.alignment;

  @override
  Map<String, dynamic> toJson() => {
        'command': command,
        'data': data,
        'type': type,
        'hri': hri,
        'font': font,
        'height': height,
        'width': width,
        'alignment': alignment
      };
}
