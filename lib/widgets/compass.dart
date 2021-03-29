import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Compass extends StatelessWidget {
  final Size size;
  final Color color;
  final String reading;
  final double rotation;
  Compass(
      {Key key, this.reading, this.color, this.size, @required this.rotation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: size.height * 0.4,
      width: size.height * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(width: 2.0, color: Colors.black)),
      child: Stack(

              children: [
          Center(child: SvgPicture.asset('assets/cardinal_points.svg'),),
          Center(
          child: _valueBall(),
        ),]
      ),
    );
  }

  Widget _valueBall() {
    return Transform.rotate(
      angle: rotation,
      child: Stack(children: [
        Center(
            child: SvgPicture.asset(
          'assets/compass.svg',
          height: size.height * 0.15,
          color: color,
        )),
        
      ]),
    );
  }
}
