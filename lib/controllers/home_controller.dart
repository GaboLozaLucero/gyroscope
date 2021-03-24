import 'dart:async';

import 'package:degrees/pages/compass_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:sensors/sensors.dart';
import 'package:vibrate/vibrate.dart';
import 'package:get/route_manager.dart';
import 'dart:math' as math;

class HomeController extends GetxController {

  
  
  double _currentDegree = 0.0;
  Color _ballColor = Color.fromRGBO(245, 66, 66, 1);
  double _topPosition = 0.0;
  bool _buttonActivation = false;
  double _limit = 0.022;
  double _lastDegree = 0.0;
  double _goal = 60/90;
  StreamSubscription flow;

  get degrees => _currentDegree;
  get color => _ballColor;
  get topPosition => _topPosition;
  get buttonActivation => _buttonActivation;
  

  

  void show() async{
    await Vibrate.canVibrate.then((value) {
      flow = accelerometerEvents.listen((AccelerometerEvent event) {
        //print(event.y);
        double normOfG = math.sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
      this._currentDegree = yInclination(event.y, normOfG);
      if (this._currentDegree>=this._lastDegree+_limit || this._currentDegree <=this._lastDegree-_limit) {
        _lastDegree = _currentDegree;
      if (this._currentDegree > (_goal-_goal*0.05) && this._currentDegree < (_goal+_goal*0.05)) {
        _ballColor = Color.fromRGBO(66, 245, 69, 1);
        Vibrate.feedback(FeedbackType.light);
      
        this._buttonActivation = true;
        
      
      } else {
        _ballColor = Color.fromRGBO(245, 66, 66, 1);
        this._buttonActivation = false;
        
      }
      
      update(['ball', 'btn']);
      }
      
    });
    });
    
  }

  double move(double degrees, Size size){
    this._topPosition = ((size.height/2)*(degrees))+((size.height*0.5))-size.height*0.025;
    return this._topPosition;

  }
  double yInclination(double event, double normOfG){
    double y = event / normOfG;
    
    
    return y;
  }


  

  @override
  void onInit() {

    super.onInit();

    show();
    
  }
 
  void click(){
    flow.cancel().then((value) => 
    Get.to(()=>CompassPage(), transition: Transition.rightToLeft)
    );
    
  
  }

  
}
