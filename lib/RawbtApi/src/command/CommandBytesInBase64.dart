
import 'IRawbtCommand.dart';

class CommandBytesInBase64 implements IRawbtCommand {
    final String command = "sendBytes"; // for GSON
    String base64;

    CommandBytesInBase64(this.base64);

    @override
    Map<String, dynamic> toJson() => {
        'command': command,
        'base64':base64,
    };
}
