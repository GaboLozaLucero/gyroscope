import 'package:degrees/controllers/home_controller.dart';
import 'package:degrees/pages/compass_page.dart';
import 'package:degrees/widgets/groundline.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    final size0 = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height - padding.top;
    final size = Size(size0.width, height);
    return GetBuilder(
      init: HomeController(),
      builder: (_) => Scaffold(
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
              Positioned(
                bottom: size.height * 0.125,
                right: 10.0,
                child: GetBuilder<HomeController>(
                  id: 'btn',
                  builder: (_) {
                    return _button();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _background(Size size, bool activated) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     //crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       SizedBox(
  //         height: 100,
  //       ),
  //       Text(
  //         'Grados: ',
  //         style: TextStyle(fontSize: 24),
  //       ),
  //       SizedBox(
  //         width: double.infinity,
  //         height: 5.0,
  //       ),
  //       GetBuilder<HomeController>(
  //         id: 'text',
  //         builder: (_) {
  //           return Text(
  //             _.degrees.toStringAsFixed(2),
  //             style: TextStyle(fontSize: 24),
  //           );
  //         },
  //       ),
  //       SizedBox(
  //         height: 25.0,
  //       ),
  //     ],
  //   );
  // }

  Widget _ball(Size size) {
    return GetBuilder<HomeController>(
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

  Widget _button() {
    return GetBuilder<HomeController>(
      id: 'btn',
      builder: (_) {
        return ElevatedButton.icon(
          onPressed: _.buttonActivation
              ? () {
                  Get.to(()=>CompassPage());
                }
              : null,
          icon: Icon(Icons.check),
          label: Text('Siguiente \nCalibracion'),
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
              (Set<MaterialState> states) {
                return EdgeInsets.all(20.0);
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (!states.contains(MaterialState.disabled))
                  return Colors.green;
                return null; // Use the component's default.
              },
            ),
          ),
        );
      },
    );
  }
}
