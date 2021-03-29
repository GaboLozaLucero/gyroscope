import 'package:degrees/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NextButton extends StatelessWidget {
  final bool activated;
  final Widget nextPage;
  final GestureTapCallback onPressed;
  final String message;
  final Size size;
  NextButton(
      {Key key,
      @required this.activated,
      @required this.nextPage,
      @required this.onPressed,
      @required this.size,
      this.message = 'Siguiente Calibracion'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(
              width: size.width*0.1655,
            ),
            OutlinedButton(
              onPressed: () {
                Get.off(() => HomePage(), transition: Transition.fadeIn);
              },
              child: Text('Menú Principal'),
              style: ButtonStyle(padding:
                  MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
                  return EdgeInsets.symmetric(vertical : size.height*0.0123, horizontal: size.width*0.03);
                },
              ), foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return Colors.black;
                  // Use the component's default.
                },
              ), side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
                  return BorderSide(color: Colors.black);
                  // Use the component's default.
                },
              ), shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (Set<MaterialState> states) {
                  return StadiumBorder();
                },
              ),
              minimumSize: MaterialStateProperty.resolveWith<Size>(
                (states){
                  return Size(size.width*0.32, size.height*0.0525);
                },
              ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            OutlinedButton(
              onPressed: activated ? onPressed : null,
              
              child: Text(message),
              style: ButtonStyle(padding:
                  MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
                  return EdgeInsets.symmetric(vertical : size.height*0.0123, horizontal: size.width*0.03);
                },
              ), foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (!states.contains(MaterialState.disabled))
                    return Colors.greenAccent;
                  return null; // Use the component's default.
                },
              ), side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
                  if (!states.contains(MaterialState.disabled))
                    return BorderSide(color: Colors.greenAccent, width: 2.0);
                  return null;
                  // Use the component's default.
                },
              ), shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (Set<MaterialState> states) {
                  return StadiumBorder();
                },
              ),
              minimumSize: MaterialStateProperty.resolveWith<Size>(
                (states){
                  return Size(size.width*0.32, size.height*0.0525);
                },
              ),
              ),
            ),
            SizedBox(
              width: size.width*0.1655,
            ),
          ],
        ),
        SizedBox(
          height: size.height*0.094,
        )
      ],
    );
  }
}
