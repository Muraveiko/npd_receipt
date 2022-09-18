
import 'IRawbtCommand.dart';
import '../attributes/AttributesString.dart';


class CommandLeftRightText implements IRawbtCommand{
    final String command = "leftRightText"; // for GSON

    // ===== param ====

    String leftText = "";
    String rightText = "";
    int leftIndent = 0;
    int rightIndent = 0;
    AttributesString leftAttr;
    AttributesString rightAttr;


    CommandLeftRightText(this.leftText, this.rightText, AttributesString attr) :
        leftAttr = attr,
        rightAttr = attr
    ;


    CommandLeftRightText.fullAttr(this.leftText, this.rightText, this.leftIndent, this.rightIndent, this.leftAttr, this.rightAttr);

    @override
    Map<String, dynamic> toJson() => {
        'command': command,
        'leftText':leftText,
        'rightText':rightText,
        'leftIndent':leftIndent,
        'rightIndent':rightIndent,
        'leftAttr':leftAttr.toJson(),
        'rightAttr':rightAttr.toJson(),
    };

}
