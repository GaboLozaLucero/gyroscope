import 'package:degrees/pages/inclination_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sensors',
      theme: ThemeData(primaryColor: Color.fromRGBO(69, 69, 69, 1)),
      home: InclinationPage(),
      debugShowCheckedModeBanner: false,
     
    );
  }
}
