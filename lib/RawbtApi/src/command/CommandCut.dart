
import 'IRawbtCommand.dart';


class CommandCut implements IRawbtCommand {
    final String command = "cut"; // for GSON

    @override
    Map<String, dynamic> toJson() => {
        'command': command,
    };
}
