import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {

  final bool activated;
  final Widget nextPage;
  final GestureTapCallback onPressed;
  final String message ;
  NextButton({Key key, @required this.activated, @required this.nextPage, @required this.onPressed, this.message = 'Siguiente \nCalibracion'}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton.icon(
        onPressed: activated
            ? onPressed
            : null,
        icon: Icon(Icons.check),
        label: Text(message),
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith <EdgeInsetsGeometry>(
            (Set<MaterialState> states) {
              return EdgeInsets.all(20.0);
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith <Color>(
            (Set<MaterialState> states) {
              if (!states.contains(MaterialState.disabled))
                return Colors.green;
              return null; // Use the component's default.
            },
          ),
        ),
      );
  }


}
