import 'package:flutter/material.dart';

class StepIcon extends StatelessWidget {
  const StepIcon({
    Key key,
    @required this.size,
    @required this.image,
    @required this.step,
    @required this.onTap,
  }) : super(key: key);

  final Size size;
  final ImageProvider image;
  final int step;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height*0.1),
      height: size.height*0.14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Paso ${step.toString()}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          SizedBox(height: size.height*0.008, width: double.infinity,),
          GestureDetector(
            child: Image(image: image, width: size.width*0.16,),
            onTap: onTap)
        ],
      ),
    );
  }
}
