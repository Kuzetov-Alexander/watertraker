import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class MyStyle {
  const MyStyle._();

  static TextStyle styleText =
      GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w600);

  static TextStyle styleTextSmall =
      GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600);
}
