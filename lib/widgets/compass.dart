import 'package:flutter/material.dart';

class Compass extends StatelessWidget {
  final Size size;
  final Color color;
  final String reading;
  Compass({Key key, this.reading, this.color , this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Center(
                  child: Text(
                reading,
                style: TextStyle(color: color, fontSize: 20.0),
              )),
            ),
          ),
        );
  }
}