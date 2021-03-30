import 'package:flutter/material.dart';

class InstructionsTextSpan {
  InstructionsTextSpan();

  TextSpan regularText(String text){
    return TextSpan(
        text: text,
        style: TextStyle(color: Colors.black),
    );
  }
  TextSpan boldText(String text){
    return TextSpan(
        text: text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
  TextSpan redText(String text){
    return TextSpan(
        text: text,
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    );
  }
  TextSpan greenText(String text){
    return TextSpan(
        text: text,
        style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
    );
  }

}