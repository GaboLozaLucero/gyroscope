import 'package:degrees/controllers/compass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CompassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompassController>(
      init: CompassController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: Center(child: Text('')),
        );
      },
    );
  }
}
