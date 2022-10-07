import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MyTextStyle {
  TextStyle get textTitle {
    return GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold);
  }

  TextStyle get textSub {
    return GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500);
  }
}
