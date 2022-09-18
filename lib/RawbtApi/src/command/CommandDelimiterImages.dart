
import 'IRawbtCommand.dart';

class CommandDelimiterImages implements IRawbtCommand {
    final String command = "delimiterImages"; // for GSON

    @override
    Map<String, dynamic> toJson() => {
        'command': command,
    };
}
