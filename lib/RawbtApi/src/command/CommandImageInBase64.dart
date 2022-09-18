
import 'IRawbtCommand.dart';
import '../attributes/AttributesImage.dart';


class CommandImageInBase64 implements IRawbtCommand {
    final String command = "image"; // for GSON
    final String base64;
    AttributesImage attributesImage;

    CommandImageInBase64(this.base64 , { this.attributesImage = const AttributesImage() });

    @override
    Map<String, dynamic> toJson() => {
        'command': command,
        'base64':base64,
        'attributesImage':attributesImage.toJson(),
    };

}
