import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionsTextSpan {
  InstructionsTextSpan();

  TextSpan regularText(String text){
    return TextSpan(
        text: text,
        style: GoogleFonts.quicksand(color: Colors.black,),
    );
  }
  TextSpan boldText(String text){
    return TextSpan(
        text: text,
        style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
  TextSpan redText(String text){
    return TextSpan(
        text: text,
        style: GoogleFonts.quicksand(color: Colors.red, fontWeight: FontWeight.bold),
    );
  }
  TextSpan greenText(String text){
    return TextSpan(
        text: text,
        style: GoogleFonts.quicksand(color: Colors.greenAccent, fontWeight: FontWeight.bold),
    );
  }

}