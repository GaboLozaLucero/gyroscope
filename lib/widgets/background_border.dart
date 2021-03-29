import 'package:flutter/material.dart';
class BackgroundBorder extends StatelessWidget {
  const BackgroundBorder({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: size.height*0.9267,
        width: size.width*0.8533,
        decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20)

        ),
      ),
    );
  }
}