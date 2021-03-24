import 'package:degrees/pages/compass_page.dart';
import 'package:degrees/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sensors',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
     
    );
  }
}
