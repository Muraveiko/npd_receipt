
import '../Constants.dart';

class AttributesBarcode {
    // default
    static const String _hri = Constant.HRI_NONE;
    static const int _font = Constant.FONT_A;
    static const int _width = 3;
    static const int _height = 162;
    static const String _alignment = Constant.ALIGNMENT_LEFT;

    // -----------------
    final String type;
    final String hri;
    final int font;
    final int height;
    final int width;
    final String alignment;

    const AttributesBarcode(this.type,{
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    });


    const AttributesBarcode.upcA({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_UPC_A;

    const AttributesBarcode.upcE({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_UPC_E;

    const AttributesBarcode.ean13({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_EAN13;

    const AttributesBarcode.jan13({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_JAN13;

    const AttributesBarcode.ean8({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_EAN8;

    const AttributesBarcode.jan8({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_JAN8;

    const AttributesBarcode.code39({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_CODE39;

    const AttributesBarcode.code93({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_CODE93;

    const AttributesBarcode.code128({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_CODE128;

    const AttributesBarcode.itf({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_ITF;

    const AttributesBarcode.codabar({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_CODABAR;

    const AttributesBarcode.gs1_128({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_GS1_128;

    const AttributesBarcode.gs1DatabarExpanded({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_GS1_DATABAR_EXPANDED;

    const AttributesBarcode.gs1DatabarLimited({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_GS1_DATABAR_LIMITED;

    const AttributesBarcode.gs1DatabarOmniDirectional({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_GS1_DATABAR_OMNIDIRECTIONAL;

    const AttributesBarcode.gs1DatabarTruncated({
        this.hri = _hri,
        this.font = _font,
        this.height = _height,
        this.width = _width,
        this.alignment = _alignment,
    }): type = Constant.BARCODE_GS1_DATABAR_TRUNCATED;


    Map<String, dynamic> toJson() => {
        'type':type,
        'hri':hri,
        'font':font,
        'height':height,
        'width':width
    };
}
