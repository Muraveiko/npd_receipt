class DescriptionRow {
  String? part;
  String? style;

  DescriptionRow({this.part, this.style});

  static DescriptionRow fromJSON(Map<String, dynamic> data) {

    final part = data['part'] as String?;
    final style = data['style'] as String?;

    return DescriptionRow(part: part, style: style);
  }
}