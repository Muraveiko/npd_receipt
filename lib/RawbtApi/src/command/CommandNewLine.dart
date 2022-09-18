
import 'IRawbtCommand.dart';

class CommandNewLine implements IRawbtCommand{
    final String command = "ln"; // for GSON
    final int count;

    CommandNewLine({this.count=1});

    @override
    Map<String, dynamic> toJson() => {
        'command': command,
        'count':count,
    };
}
