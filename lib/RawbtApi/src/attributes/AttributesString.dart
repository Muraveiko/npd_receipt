import '../Constants.dart';

class AttributesString {
  // type: string

  final int fontsCpi;
  final int internationalChars;

  // if text printed as image
  final int truetypeFontSize;

  // свойства для строки
  final int printerFont;

  final String alignment;
  final bool bold;
  final bool doubleHeight;
  final bool doubleWidth;
  final bool underline;

  final String lang;


  const AttributesString({
    this.fontsCpi = Constant.CPI_DEFAULT,
    this.internationalChars = 0,
    this.truetypeFontSize = 21,
    this.printerFont = Constant.FONT_DEFAULT,
    this.alignment = Constant.ALIGNMENT_LEFT,
    this.bold = false,
    this.doubleHeight = false,
    this.doubleWidth = false,
    this.underline = false,
    this.lang = "default"
  });
  // ===================

  bool isFontA() {
    return printerFont == Constant.FONT_A;
  }

  bool isFontB() {
    return printerFont == Constant.FONT_B;
  }

  bool isFontC() {
    return printerFont == Constant.FONT_C;
  }



  Map<String, dynamic> toJson() => {
        'fontsCpi': fontsCpi,
        'internationalChars': internationalChars,
        'truetypeFontSize': truetypeFontSize,
        'printerFont': printerFont,
        'alignment': alignment,
        'bold': bold,
        'doubleHeight': doubleHeight,
        'doubleWidth': doubleWidth,
        'underline': underline,
        'lang': lang,
      };


}
