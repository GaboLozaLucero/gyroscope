import 'package:degrees/pages/home_page.dart';
import 'package:degrees/pages/lnbf_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      title: 'Sensors',
      theme: ThemeData(primaryColor: Color.fromRGBO(69, 69, 69, 1),textTheme: GoogleFonts.quicksandTextTheme()),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
