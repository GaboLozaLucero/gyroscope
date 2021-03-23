import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sensors/sensors.dart';
import 'dart:math';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:vibrate/vibrate.dart';

class CompassController extends GetxController {
  double _heading = 1;
  double _lastHeading =0;
  double _limit = 1;
  Color _ballColor = Colors.redAccent;


    String get readout => _heading.toStringAsFixed(0) + '°';
    Color get color => _ballColor;
  void gyro(){
    
    FlutterCompass.events.listen((event) {
      _lastHeading = event.heading;
      if(this._heading>=this._lastHeading+_limit || this._heading <=this._lastHeading-_limit){

      
      _heading = _lastHeading;
      print(readout);
      if (_heading <1 && _heading >=0 || _heading <361 && _heading >=358) {
        Vibrate.feedback(FeedbackType.success);
        _ballColor = Colors.greenAccent;
      }
      else{
        _ballColor = Colors.redAccent;
      }
      update(['compass']);}
    });

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    gyro();
  }

}