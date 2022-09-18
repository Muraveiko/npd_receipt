import '../Constants.dart';

class AttributesQRcode{

    final String alignment;
    final int multiply;

    const AttributesQRcode({
        this.alignment = Constant.ALIGNMENT_CENTER,
        this.multiply = 3
    });

    Map<String, dynamic> toJson() => {
        'alignment':alignment,
        'multiply':multiply,
    };
}
