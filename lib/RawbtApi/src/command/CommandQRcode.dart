
import 'IRawbtCommand.dart';

import '../attributes/AttributesQRcode.dart';



class CommandQRcode implements IRawbtCommand{
    final String command = "qrcode"; // for GSON

    final String data;
    final String alignment;
    final int multiply;


    CommandQRcode(this.data, AttributesQRcode attr) :
        alignment = attr.alignment,
        multiply = attr.multiply;


    @override
    Map<String, dynamic> toJson() => {
        'command': command,
        'data':data,
        'alignment':alignment,
        'multiply':multiply,
    };

}
