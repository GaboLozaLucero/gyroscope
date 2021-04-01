import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {
  final int step;
  final String title;
  final RichText instruction;
  final String assetLocation;
  final Size size;
  Instructions(
      {Key key,
      @required this.step,
      @required this.title,
      @required this.assetLocation,
      @required this.size,
      @required this.instruction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            height: size.height * 0.20,
            width: size.width * 0.25,
            child: Column(
              children: [
                Text(
                  'Paso $step',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Image(image: AssetImage(assetLocation)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            height: size.height * 0.25,
            width: size.width * 0.70,
            child: Column(
              children: [
                Text(
                  '$title',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Container(width: double.infinity, child: instruction),
                Text(
                    'Toca cualquier área fuera del recuadro para continuar. Siempre puedes volver a ver estas instrucciones tocando el icono de "info" en la esquina superior derecha')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
