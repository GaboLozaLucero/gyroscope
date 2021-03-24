import 'package:degrees/controllers/compass_controller.dart';
import 'package:degrees/pages/final_page.dart';
import 'package:degrees/widgets/compass.dart';
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
        return Scaffold(
          body: Stack(children: [
            Center(
              child: compass(size),
            ),
            _button(size)
          ]),
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
        reading: _.readout,);
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
        nextPage: FinalPage(),
        onPressed: ()=>_.click(size));
      },
    )
            );
  }
}
