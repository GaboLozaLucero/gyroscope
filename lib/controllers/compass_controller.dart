import 'dart:async';

import 'package:degrees/pages/final_page.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:vibrate/vibrate.dart';

class CompassController extends GetxController {
  double _heading = 1;
  double _lastHeading =0;
  double _limit = 1;
  Color _ballColor = Colors.redAccent;
  bool _buttonActivation = false;
  StreamSubscription flow;

    String get readout => _heading.toStringAsFixed(0) + '° '+octant(_heading);
    Color get color => _ballColor;
    bool get buttonActivation => _buttonActivation;

  void gyro(){
    
    flow = FlutterCompass.events.listen((event) {
      _lastHeading = event.heading;
      if(this._heading>=this._lastHeading+_limit || this._heading <=this._lastHeading-_limit){

      
      _heading = _lastHeading;
      
      // if (_heading <1 && _heading >=0 || _heading <361 && _heading >=358) {
      //   Vibrate.feedback(FeedbackType.success);
      //   _ballColor = Colors.greenAccent;
      //   _buttonActivation = true;
        
      // }
      if (_heading <=136 && _heading >=134) {
        Vibrate.feedback(FeedbackType.success);
        _ballColor = Colors.greenAccent;
        _buttonActivation = true;
        
      }
      else{
        _ballColor = Colors.redAccent;
        _buttonActivation = false;
        
      }
      update(['compass', 'btn']);}
    });

  }

  String octant(double orientation) {
    String resp = '';
    if (orientation <= 22 && orientation >=0 ||orientation >= 337) {
      resp = 'N';
    }
    if (orientation <= 67 && orientation >=22) {
      resp = 'NE';
    }
    if (orientation <= 112 && orientation >=67) {
      resp = 'E';
    }
    if (orientation <= 157 && orientation >=112) {
      resp = 'SE';
    }
    if (orientation <= 202 && orientation >=157) {
      resp = 'S';
    }
    if (orientation <= 247 && orientation >=202) {
      resp = 'SW';
    }
    if (orientation <= 292 && orientation >=248) {
      resp = 'W';
    }
    if (orientation <= 337 && orientation >=292) {
      resp = 'NW';
    }
    return resp;


  } 

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    gyro();

  }
  void click(){
    flow.cancel().then((value) => 
    Get.to(()=>FinalPage(), transition: Transition.rightToLeft)
    );
    
  
  }

}