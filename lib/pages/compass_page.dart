import 'package:degrees/controllers/compass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CompassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size0 = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height - padding.top;
    final size = Size(size0.width, height);
    return GetBuilder<CompassController>(
      init: CompassController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: Center(
            child: compass(size),
          ),
        );
      },
    );
  }

  Widget compass(Size size) {
    return GetBuilder<CompassController>(
      id: 'compass',
      builder: (_) {
        return Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: size.height * 0.45,
          width: size.height * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              border: Border.all(width: 2.0, color: Colors.black)),
          child: Center(
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
      },
    );
  }
}
