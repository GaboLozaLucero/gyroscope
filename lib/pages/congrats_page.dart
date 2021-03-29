import 'package:degrees/pages/compass_page.dart';
import 'package:degrees/pages/inclination_page.dart';

import 'package:degrees/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CongratsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = Get.arguments[0];
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Center(child: Text('felicidades lo lograste')),
          NextButton(
            activated: true,
            nextPage: InclinationPage(),
            onPressed: () =>
                Get.off(() => CompassPage(), transition: Transition.zoom, arguments: [size]),
            message: 'Volver a Empezar',
            size: size,
          )
        ]),
      ),
    );
  }
}
