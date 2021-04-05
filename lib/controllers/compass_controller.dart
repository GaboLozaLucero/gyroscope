import 'dart:async';
import 'package:degrees/pages/inclination_page.dart';
import 'package:degrees/widgets/instructions.dart';
import 'package:degrees/widgets/instructions_text_span.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:vibrate/vibrate.dart';

class CompassController extends GetxController {
  double _heading = 1;
  double _lastHeading = 0;
  double _limit = 1;
  Color _ballColor = Colors.redAccent;
  bool _buttonActivation = false;
  double _angle = 135;
  String _btnText = 'Sigue rotando';
  StreamSubscription _flow;
  Size _size;

  String get readout => _heading.toStringAsFixed(0) + '° ' + octant(_heading);
  double get rotation => _heading * (math.pi / 180) * -1;
  Color get color => _ballColor;
  bool get buttonActivation => _buttonActivation;
  String get buttonText => _btnText;
  StreamSubscription get subscription => _flow;
  double get angle => (_angle - 60) * (math.pi / 180);
  void bodySize(Size size) => _size = size;


  void gyro() {
    _flow = FlutterCompass.events.listen((event) {
      _lastHeading = event.heading;
      if (this._heading >= this._lastHeading + _limit ||
          this._heading <= this._lastHeading - _limit) {
        _heading = _lastHeading;

        if (_heading <= _angle + 3 && _heading >= _angle - 3) {
          Vibrate.feedback(FeedbackType.success);
          _ballColor = Colors.greenAccent;
          _buttonActivation = true;
          _btnText = 'Ir al paso 3';
        } else {
          _ballColor = Colors.redAccent;
          _buttonActivation = false;
          _btnText = 'Sigue rotando';
        }
        update(['compass', 'btn', 'goal']);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    gyro();
  }

  void click(Size size) {
    _flow.cancel().then((value) => Get.off(() => InclinationPage(),
        transition: Transition.rightToLeft, arguments: [size]));
  }

  String octant(double orientation) {
    String resp = '';

    if (orientation <= 22 && orientation >= 0 || orientation >= 337) {
      resp = 'N';
    }
    if (orientation <= 67 && orientation >= 22) {
      resp = 'NE';
    }
    if (orientation <= 112 && orientation >= 67) {
      resp = 'E';
    }
    if (orientation <= 157 && orientation >= 112) {
      resp = 'SE';
    }
    if (orientation <= 202 && orientation >= 157) {
      resp = 'S';
    }
    if (orientation <= 247 && orientation >= 202) {
      resp = 'SW';
    }
    if (orientation <= 292 && orientation >= 248) {
      resp = 'W';
    }
    if (orientation <= 337 && orientation >= 292) {
      resp = 'NW';
    }
    return resp;
  }

  @override
  void onReady() {
    super.onReady();
    instructions(_size);
  }

  void instructions(Size size) {
    Get.bottomSheet(Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Colors.white),
        child: Instructions(
            step: 2,
            title: 'Brújula',
            size: size,
            instruction: RichText(
              textAlign: TextAlign.justify,
                text: TextSpan(
                    text: 'Pon el celular ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                  InstructionsTextSpan().boldText('sobre la antena '),
                  InstructionsTextSpan().regularText('y haz que la '),
                  InstructionsTextSpan().boldText('punta de la flecha '),
                  InstructionsTextSpan().regularText('coincida con la '),
                  InstructionsTextSpan().redText('linea roja. '),
                  InstructionsTextSpan().regularText('Cuando la '),
                  InstructionsTextSpan().redText('linea roja '),
                  InstructionsTextSpan().boldText('se ponga '),
                  InstructionsTextSpan().greenText('verde '),
                  InstructionsTextSpan().regularText('será la orientación adecuada. \n'),
                  
                ])
                ),
            assetLocation: 'assets/compass_icon.png')));
  }
}
