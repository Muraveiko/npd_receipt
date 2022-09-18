class Constant {
  // RAWBT_CONTENT_TYPE = {image,pdf,prn,txt,html, unsupported}

  static const int DITHERING_BW = 0;
  static const int DITHERING_SF = 1;
  static const int DITHERING_ATKINSON = 2;
  static const int DITHERING_BURKES = 3;
  static const int DITHERING_SIERA = 4;
  static const int DITHERING_SKETCH = 5;
  static const int DITHERING_BEST_CONTRAST = 6;
  static const int DITHERING_REGULAR = 7 ;
  static const int DITHERING_NONE_RESIZE_ONLY = 8 ;
  static const int DITHERING_127 = 9;


  static const int FONT_DEFAULT = 0;
  static const int FONT_A = 1;
  static const int FONT_B = 2;
  static const int FONT_C = 3;
  static const int FONT_TRUE_TYPE = 4;

  static const int CPI_DEFAULT = 0;
  static const int CPI_NORMAL = 1;
  static const int CPI_CONDENSED = 2;
  static const int CPI_MONO = 3;


// Alignment
  static const String ALIGNMENT_LEFT = "left";
  static const String ALIGNMENT_RIGHT = "right";
  static const String ALIGNMENT_CENTER = "center";

// barcode
  static const String BARCODE_UPC_A = "upc_a";
  static const String BARCODE_UPC_E = "upc_e";
  static const String BARCODE_EAN13 = "ean13";
  static const String BARCODE_JAN13 = "jan13";
  static const String BARCODE_EAN8 = "ean8";
  static const String BARCODE_JAN8 = "jan8";
  static const String BARCODE_CODE39 = "code39";
  static const String BARCODE_CODE93 = "code93";
  static const String BARCODE_CODE128 = "code128";

  static const String BARCODE_ITF = "itf";
  static const String BARCODE_CODABAR = "codabar";
  static const String BARCODE_GS1_128 = "gs1_128";
  static const String BARCODE_GS1_DATABAR_OMNIDIRECTIONAL = "databar_omni";
  static const String BARCODE_GS1_DATABAR_TRUNCATED = "databar_trunc";
  static const String BARCODE_GS1_DATABAR_LIMITED = "databar_limit";
  static const String BARCODE_GS1_DATABAR_EXPANDED = "databar_expand";

// hri
  static const String HRI_NONE = "none";
  static const String HRI_ABOVE = "above";
  static const String HRI_BELOW = "below";
  static const String HRI_BOTH = "both";
  
}