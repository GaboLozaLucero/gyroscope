import 'package:degrees/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '60 deg verification',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
     
    );
  }
}
