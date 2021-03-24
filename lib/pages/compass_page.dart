import 'package:degrees/controllers/compass_controller.dart';
import 'package:degrees/pages/final_page.dart';
import 'package:degrees/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

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
          body: Stack(children: [
            Center(
              child: compass(size),
            ),
            Positioned(
              bottom: size.height * 0.125,
              right: 10.0,
              child: _button())]
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
              height: size.height * 0.1,
              width: size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black26,
              ),
              child: Center(child: Text(_.readout, style: TextStyle(color: _.color, fontSize: 20.0),)),
            ),
          ),
        );
      },
    );
  }
  Widget _button() {
    return GetBuilder<CompassController>(
      id: 'btn',
      builder: (_) {
        return NextButton(activated: _.buttonActivation, nextPage: FinalPage(), onPressed: ()=> _.click());
      },
    );
  }
}
