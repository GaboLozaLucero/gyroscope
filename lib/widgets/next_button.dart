import 'package:degrees/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NextButton extends StatelessWidget {
  final bool activated;
  final Widget nextPage;
  final GestureTapCallback onPressed;
  final String message;
  NextButton(
      {Key key,
      @required this.activated,
      @required this.nextPage,
      @required this.onPressed,
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
              width: 35,
            ),
            OutlinedButton(
              onPressed: () {
                Get.to(() => HomePage());
              },
              child: Text('Menú Principal'),
              style: ButtonStyle(padding:
                  MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
                  return EdgeInsets.all(10.0);
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
              )),
            ),
            Expanded(
              child: SizedBox(),
            ),
            OutlinedButton.icon(
              onPressed: activated ? onPressed : null,
              icon: Icon(Icons.check),
              label: Text(message),
              style: ButtonStyle(padding:
                  MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                (Set<MaterialState> states) {
                  return EdgeInsets.all(5.0);
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
                    return BorderSide(color: Colors.greenAccent);
                  return null;
                  // Use the component's default.
                },
              ), shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (Set<MaterialState> states) {
                  return StadiumBorder();
                },
              )),
            ),
            SizedBox(
              width: 25,
            ),
          ],
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
