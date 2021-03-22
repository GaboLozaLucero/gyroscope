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
              _background(_.degrees, size),
              CustomPaint(
                painter: groundLinePainter(),
                size: size,
              ),
              _goal(size),
              _ball(size, _.color,_.move(_.degrees, size)),
              
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _background(double degrees, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        
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
        ),
        SizedBox(
          height: 25.0,
        ),
      ],
    );
  }

  Widget _ball(Size size, Color color, double topPosition) {
    
    return Positioned(
      bottom: topPosition,
      left: (size.width * 0.5) - (size.height * 0.025),
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        height: size.height * 0.05,
        width: size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color,
        ),
      ),
    );
  }

  Widget _goal(Size size) {
    return Positioned( 
          top: (size.height * 0.10) ,
          left: (size.width * 0.5) - (size.height * 0.035),
          child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        height: size.height * 0.07,
        width: size.height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          
          border: Border.all(width: 2.0, color: Colors.black)
        ),
      ),);
  }

}
