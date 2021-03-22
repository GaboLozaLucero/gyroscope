import 'package:degrees/controllers/home_controller.dart';
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
              _background(_.degrees, size),
              _ball(size, _.color),
            ],
          ),
        ),
      ),
    );
  }

  Widget _background(double degrees, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Grados: ',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          width: double.infinity,
          height: 5.0,
        ),
        Text(
          degrees.toStringAsFixed(2),
          style: TextStyle(fontSize: 24),
        )
      ],
    );
  }

  Widget _ball(Size size, Color color) {
    return Positioned(
      top: (size.height * 0.5) - (size.height * 0.025),
      left: (size.width * 0.5) - (size.height * 0.025),
      child: Container(
        height: size.height * 0.05,
        width: size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color,
        ),
      ),
    );
  }
}
