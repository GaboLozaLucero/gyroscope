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
      height: size.height * 0.3,
      width: size.height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(width: 2.0, color: Colors.black)),
      child: Center(
        child: _valueBall(),
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
          height: size.height * 0.20,
          color: color,
        )),
        Center(
          child: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            height: size.height * 0.1,
            width: size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black54,
            ),
            child: Center(
                child: Text(
              reading,
              style: TextStyle(color: color, fontSize: 15.0),
            )),
          ),
        ),
      ]),
    );
  }
}
