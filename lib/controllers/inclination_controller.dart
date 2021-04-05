import 'dart:async';

import 'package:degrees/pages/congrats_page.dart';
import 'package:degrees/widgets/instructions.dart';
import 'package:degrees/widgets/instructions_text_span.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sensors/sensors.dart';
import 'package:vibrate/vibrate.dart';
import 'package:get/route_manager.dart';
import 'dart:math' as math;

class InclinationController extends GetxController {
  double _currentDegree = 0.0;
  Color _ballColor = Color.fromRGBO(245, 66, 66, 1);
  double _topPosition = 0.0;
  bool _buttonActivation = false;
  double _limit = 0.022;
  double _lastDegree = 0.0;
  double _goal = 60 / 90;
  String _btnText = 'Inclina más';
  Size _size;
  StreamSubscription _flow;

  double get degrees => _currentDegree;
  Color get color => _ballColor;
  double get topPosition => _topPosition;
  bool get buttonActivation => _buttonActivation;
  StreamSubscription get subscription => _flow;
  String get buttonText => _btnText;
  void bodySize(Size size) => _size = size;
  
  void show() async {
    await Vibrate.canVibrate.then((value) {
      _flow = accelerometerEvents.listen((AccelerometerEvent event) {
        double normOfG = math
            .sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

        this._currentDegree = yInclination(event.y, normOfG);

        if (this._currentDegree >= this._lastDegree + _limit ||
            this._currentDegree <= this._lastDegree - _limit) {
          _lastDegree = _currentDegree;

          if (this._currentDegree > (_goal - _goal * 0.05) &&
              this._currentDegree < (_goal + _goal * 0.05)) {
            _ballColor = Color.fromRGBO(66, 245, 69, 1);

            Vibrate.feedback(FeedbackType.light);

            this._buttonActivation = true;
            _btnText = 'Terminar';
          } else {
            _ballColor = Color.fromRGBO(245, 66, 66, 1);
            this._buttonActivation = false;
            _btnText = 'Inclina más';
          }

          update(['ball', 'btn']);
        }
      });
    });
  }

  double move(double degrees, Size size) {
    if (degrees>=0) {
      this._topPosition = ((size.height *0.375) * (degrees)) +
        size.height * 0.025+size.height*0.2766;
    }else{
      this._topPosition = 
        size.height * 0.025+size.height*0.2766;
    }

    
    
    return this._topPosition;
  }

  double yInclination(double event, double normOfG) {
    double y = event / normOfG;

    return y;
  }

  @override
  void onInit() {
    super.onInit();

    show();
  }

  @override
  void onReady() {
    super.onReady();
    instructions(_size);
  }

  void click(Size size) {
    _flow.cancel().then((value) => Get.off(() => CongratsPage(),
        transition: Transition.rightToLeft, arguments: [size]));
  }

  void instructions(Size size) {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white),
      child: Instructions(
          step: 3,
          title: 'Giroscopio ',
          size: size,
          instruction: RichText(
            textAlign: TextAlign.justify,
              text: TextSpan(
                  text: 'Pon el celular ',
                  style: TextStyle(color: Colors.black),
                  
                  children: <TextSpan>[
                InstructionsTextSpan().boldText('sobre la antena '),
                InstructionsTextSpan().regularText('e inclina tu celular para hacer que el '),
                InstructionsTextSpan().redText('círculo rojo '),
                InstructionsTextSpan().regularText('coincida con la '),
                InstructionsTextSpan().boldText('meta. '),
                InstructionsTextSpan().regularText('Cuando el '),
                InstructionsTextSpan().redText('círculo rojo '),
                InstructionsTextSpan().regularText('se ponga '),
                InstructionsTextSpan().greenText('verde '),
                InstructionsTextSpan().regularText('será la orientación adecuada. \n'),
              ])),
          assetLocation: 'assets/inclination_icon.png'),
    ));
  }
}
