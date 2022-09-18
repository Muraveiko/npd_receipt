import '../Constants.dart';

class AttributesImage {
  final int graphicFilter ;
  final bool rotateImage;
  final bool inverseColor;
  final int scale;
  final bool doScale;
  final String alignment;

  const AttributesImage({
    this.graphicFilter = Constant.DITHERING_BW,
    this.rotateImage = false,
    this.inverseColor = false,
    this.scale = 16,
    this.doScale = true,
    this.alignment  = Constant.ALIGNMENT_LEFT
  });

  Map<String, dynamic> toJson() => {
        'graphicFilter': graphicFilter,
        'rotateImage': rotateImage,
        'inverseColor':inverseColor,
        'scale':scale,
        'doScale':doScale,
        'alignment':alignment,
      };
}
