import 'package:degrees/controllers/compass_controller.dart';
import 'package:degrees/pages/congrats_page.dart';
import 'package:degrees/widgets/background_border.dart';
import 'package:degrees/widgets/compass.dart';
import 'package:degrees/widgets/instructions.dart';
import 'package:degrees/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CompassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = Get.arguments[0];
    return GetBuilder<CompassController>(
      init: CompassController(),
      initState: (_) {},
      builder: (_) {
        _.bodySize(size);
        return Scaffold(
          appBar: AppBar(
            title: Text('BestSat', style: TextStyle(fontSize: 20),),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () {
                    _.instructions(size);
                  })
            ],
          ),
          body: Stack(children: [
            BackgroundBorder(size: size),
            _goal(size),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: compass(size),
                ),
              ],
            ),
            _button(size),
          ]),
        );
      },
    );
  }

  Widget _goal(Size size) {
    return GetBuilder<CompassController>(
      id: 'goal',
      builder: (_) {
        return Transform.rotate(
          angle: 1 / (_.angle),
          child: Center(
              child: Container(
            height: size.height * 0.35,
            width: 5,
            decoration: BoxDecoration(
            color: _.color,
            gradient: LinearGradient(
            colors: [Colors.yellow,_.color,],
            stops: [0.5, 0.5],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter
          )
            ),
          )),
        );
      },
    );
  }

  Widget compass(Size size) {
    return GetBuilder<CompassController>(
      id: 'compass',
      builder: (_) {
        return Compass(
          color: _.color,
          size: size,
          reading: _.readout,
          rotation: _.rotation,
        );
      },
    );
  }

  Widget _button(Size size) {
    return GetBuilder<CompassController>(
      id: 'btn',
      builder: (_) {
        return NextButton(
            activated: _.buttonActivation,
            nextPage: CongratsPage(),
            message: _.buttonText,
            size: size,
            onPressed: () => _.click(size));
      },
    );
  }

  Widget step1(Size size) {
    return Instructions(
        step: 1,
        title: 'Brújula',
        size: size,
        instruction: RichText(
            text: TextSpan(
                text: 'Pon el celular',
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
              TextSpan(
                text: 'sobre la antena ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'y haz que la ',
              ),
              TextSpan(
                text: 'punta de la flecha ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'concida con la \n',
              ),
              TextSpan(
                text: 'linea roja ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              TextSpan(
                text: 'cuando la ',
              ),
              TextSpan(
                text: 'linea roja ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              TextSpan(
                text: 'se ponga ',
              ),
              TextSpan(
                text: 'VERDE ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.greenAccent),
              ),
              TextSpan(
                text: 'será la orientación adecuada. \n',
              ),
            ])),
        assetLocation: 'assets/compass_icon.png');
  }
}


