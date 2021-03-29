import 'package:degrees/controllers/inclination_controller.dart';
import 'package:degrees/pages/compass_page.dart';
import 'package:degrees/widgets/background_border.dart';
import 'package:degrees/widgets/groundline.dart';
import 'package:degrees/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get_navigation/get_navigation.dart';

class InclinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO : Change size value to Get.arguments after refactor this page
    final Size size = Get.arguments[0];
      // final size = Size(411.4, 798.9);
    return GetBuilder(
      init: InclinationController(),
      builder: (_) => Scaffold(
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
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundBorder(size: size),
              Positioned(
                top: size.height*0.2766,
                left: size.width*0.1653,
                              child: Container(
                  width: size.width*0.667,
                  height: size.height*0.425,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black
                  ),
                ),
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
            size: size,
            onPressed: () => _.click(size));
      },
    );
  }

  Widget _ball(Size size) {
    return GetBuilder<InclinationController>(
      id: 'ball',
      builder: (_) => Positioned(
        bottom: _.move(_.degrees, Size(size.width, size.height)),
        left: (size.width * 0.5) - (size.height * 0.02766),
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
      top: (size.height * 0.125+size.height*0.265),
      left: (size.width * 0.5) - (size.height * 0.038),
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        height: size.height * 0.07,
        width: size.height * 0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 2.0, color: Colors.white)),
      ),
    );
  }
}
