import 'package:flutter/material.dart';

class groundLinePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final pen = new Paint();

    pen.color = Colors.black;
    pen.style = PaintingStyle.stroke;
    pen.strokeWidth = 5;
    pen.strokeCap = StrokeCap.square;

    final path = new Path();

    path.moveTo(0, size.height*0.5);
    double x=0;

    while (x < size.width) {
      path.lineTo(x+size.width/20, size.height*0.5);
      x = x+ size.width/20;
      path.moveTo(x+size.width/40, size.height*0.5);
      
      
    }
    

    canvas.drawPath(path, pen);


  }

  @override
  bool shouldRepaint(groundLinePainter oldDelegate) => true;

}