import 'package:degrees/controllers/compass_controller.dart';
import 'package:degrees/pages/congrats_page.dart';
import 'package:degrees/widgets/compass.dart';
import 'package:degrees/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'dart:math' as math;

class CompassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Size size = Get.arguments[0];
    final Size size = MediaQuery.of(context).size;
    return GetBuilder<CompassController>(
      init: CompassController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text('BestSat'), centerTitle: true,),
          body: Stack(children: [
            _goal(size),
            Center(
              child: compass(size),
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
            height: size.height * 0.6,
            width: 5,
            color: _.color,
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
    return Positioned(
        bottom: size.height * 0.125,
        right: 10.0,
        child: GetBuilder<CompassController>(
          id: 'btn',
          builder: (_) {
            return NextButton(
                activated: _.buttonActivation,
                nextPage: CongratsPage(),
                onPressed: () => _.click(size));
          },
        ));
  }
}
