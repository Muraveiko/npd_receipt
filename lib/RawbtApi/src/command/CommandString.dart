
import 'IRawbtCommand.dart';

import '../attributes/AttributesString.dart';


class CommandString implements IRawbtCommand {
    final String command = "print";

    final String text;
    final AttributesString attributesString;

    CommandString(this.text,this.attributesString);

    @override
    Map<String, dynamic> toJson() => {
        'command': command,
        'text':text,
        'attributesString':attributesString.toJson(),
    };
}
