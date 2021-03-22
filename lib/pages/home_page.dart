import 'package:degrees/controllers/home_controller.dart';
import 'package:degrees/widgets/groundline.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder(
      init: HomeController(),
      builder: (_) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              _background(size, _.buttonActivation),
              CustomPaint(
                painter: groundLinePainter(),
                size: size,
              ),
              _goal(size),
              _ball(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _background(Size size, bool activated) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _button(),
        SizedBox(
          height: 100,
        ),
        Text(
          'Grados: ',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          width: double.infinity,
          height: 5.0,
        ),
        GetBuilder<HomeController>(
          id: 'text',
          builder: (_) {
            return Text(
              _.degrees.toStringAsFixed(2),
              style: TextStyle(fontSize: 24),
            );
          },
        ),
        SizedBox(
          height: 25.0,
        ),
      ],
    );
  }

  Widget _ball(Size size) {
    return GetBuilder<HomeController>(
      id: 'ball',
      builder: (_) => Positioned(
        bottom: _.move(_.degrees, size),
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
      top: (size.height * 0.10),
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
          onPressed: (){print('Botn');},
          icon: Icon(Icons.check),
          label: Text('Siguiente Calibracion'),
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
              (Set<MaterialState> states) {
                return EdgeInsets.all(15.0);
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
