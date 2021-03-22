import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:sensors/sensors.dart';
import 'dart:math' as math;

class HomeController extends GetxController {
  double _degrees = 0.0;
  Color _ballColor = Color.fromRGBO(245, 66, 66, 1);

  get degrees => _degrees;
  get color => _ballColor;

  void show() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      double norm_Of_g =
          math.sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
      double y = event.y / norm_Of_g;
      double yInclination = (math.acos(y) * (180 / math.pi));
      this._degrees = (yInclination - 90) * -1;
      print(this._degrees);
      if (this._degrees > 60.0 && this._degrees < 61.0) {
        _ballColor = Color.fromRGBO(66, 245, 69, 1);
      } else {
        _ballColor = Color.fromRGBO(245, 66, 66, 1);
      }
      update();
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    show();
  }
}
