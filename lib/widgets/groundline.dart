import 'package:flutter/material.dart';

// ignore: camel_case_types
class groundLinePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final pen = new Paint();

    pen.color = Colors.black;
    pen.style = PaintingStyle.stroke;
    pen.strokeWidth = 5;
    pen.strokeCap = StrokeCap.square;

    final path = new Path();
    final height = (size.height*0.5);
    path.moveTo(0, height);
    double x=0;

    while (x < size.width) {
      path.lineTo(x+size.width/20, height);
      x = x+ size.width/20;
      path.moveTo(x+size.width/40, height);
      
      
    }
    

    canvas.drawPath(path, pen);


  }

  @override
  bool shouldRepaint(groundLinePainter oldDelegate) => false;

}