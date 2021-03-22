import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:sensors/sensors.dart';
import 'package:vibrate/vibrate.dart';

import 'dart:math' as math;

class HomeController extends GetxController {

  
  
  double _degrees = 0.0;
  Color _ballColor = Color.fromRGBO(245, 66, 66, 1);
  double _topPosition = 0.0;
  bool _buttonActivation = false;

  get degrees => _degrees;
  get color => _ballColor;
  get topPosition => _topPosition;
  get buttonActivation => _buttonActivation;

  

  void show() async{
    bool canVibrate = await Vibrate.canVibrate.then((value) {
      accelerometerEvents.listen((AccelerometerEvent event) {
        double normOfG = math.sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
      this._degrees = yInclination(event.y, normOfG);
      
      if (this._degrees > 59.0 && this._degrees < 62.5) {
        _ballColor = Color.fromRGBO(66, 245, 69, 1);
        Vibrate.feedback(FeedbackType.light);
        this._buttonActivation = true;
        update(['btn']);
        
      } else {
        _ballColor = Color.fromRGBO(245, 66, 66, 1);
        //this._buttonActivation = false;
      }
      update(['ball']);
      
    });
    });
    
  }

  double move(double degrees, Size size){
    this._topPosition = ((size.height/180)*degrees)+ (size.height * 0.46);
      
    return this._topPosition;

  }
  double yInclination(double event, double normOfG){
    double y = event / normOfG;
    double yInclination = (math.acos(y) * (180 / math.pi));

    return (yInclination - 90) * -1;
  }


  

  @override
  void onInit() {

    super.onInit();
    show();
    
  }

  
}
