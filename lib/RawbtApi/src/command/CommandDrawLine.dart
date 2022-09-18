

import 'IRawbtCommand.dart';
import '../attributes/AttributesString.dart';

class CommandDrawLine implements IRawbtCommand {
  final String command = "line"; // for GSON

  String ch;
  AttributesString attributesString;

  CommandDrawLine({this.ch = '-', this.attributesString = const AttributesString() });

  @override
  Map<String, dynamic> toJson() => {
    'command': command,
    'ch':ch,
    'attributesString':attributesString.toJson(),
  };

}
