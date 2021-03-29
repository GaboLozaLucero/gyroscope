import 'package:degrees/controllers/inclination_controller.dart';
import 'package:degrees/pages/compass_page.dart';
import 'package:degrees/widgets/groundline.dart';

import 'package:degrees/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_navigation/get_navigation.dart';

class InclinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = Get.arguments[0];

    return GetBuilder(
      init: InclinationController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('BestSat'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  _.instructions(size);
                })
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              //_background(size, _.buttonActivation),
              CustomPaint(
                painter: groundLinePainter(),
                size: size,
              ),
              _goal(size),
              _ball(size),
              _button(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(Size size) {
    return GetBuilder<InclinationController>(
      id: 'btn',
      builder: (_) {
        return NextButton(
            activated: _.buttonActivation,
            message: _.buttonText,
            nextPage: CompassPage(),
            onPressed: () => _.click(size));
      },
    );
  }

  Widget _ball(Size size) {
    return GetBuilder<InclinationController>(
      id: 'ball',
      builder: (_) => Positioned(
        bottom: _.move(_.degrees, Size(size.width, size.height)),
        left: (size.width * 0.5) - (size.height * 0.025),
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: size.height * 0.05,
          width: size.height * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _.color,
          ),
        ),
      ),
    );
  }

  Widget _goal(Size size) {
    return Positioned(
      top: (size.height * 0.125),
      left: (size.width * 0.5) - (size.height * 0.035),
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        height: size.height * 0.07,
        width: size.height * 0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 2.0, color: Colors.black)),
      ),
    );
  }
}
