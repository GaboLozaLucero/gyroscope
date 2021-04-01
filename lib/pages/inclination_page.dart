import 'package:degrees/controllers/inclination_controller.dart';
import 'package:degrees/pages/compass_page.dart';
import 'package:degrees/widgets/background_border.dart';
import 'package:degrees/widgets/next_button.dart';
import 'package:degrees/widgets/step_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class InclinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Change size value to Get.arguments after refactor this page
    //final size = Size(411.4, 798.9);
    final Size size = Get.arguments[0];
    return GetBuilder(
      init: InclinationController(),
      builder: (_) {
        _.bodySize(size);
         return Scaffold(
        appBar: AppBar(
          title: Text('BestSat', style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold) ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  _.instructions(size);
                })
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: inclinationContainer(size, _),
          ),
        ),
      );}
    );
  }

  List<Widget> inclinationContainer(Size size, _) {
    return [           
            BackgroundBorder(size: size),
            Positioned(
              top: size.height*0.2766,
              left: size.width*0.1653,
              child: ClipPath(
                clipper: TrapezoidClipper(),
                child: Container(
                width: size.width*0.667,
                height: size.height*0.425,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black
                ),
              ),
                            ),
            ),
            StepIcon(size: size, 
            image: AssetImage('assets/inclination_icon.png'), 
            step: 2, onTap: ()=>_.instructions(size)),
            _goal(size),
            _ball(size),
            _button(size),
          ];
  }

  Widget _button(Size size) {
    return GetBuilder<InclinationController>(
      id: 'btn',
      builder: (_) {
        return NextButton(
            activated: _.buttonActivation,
            message: _.buttonText,
            nextPage: CompassPage(),
            size: size,
            flow: _.subscription,
            onPressed: () => _.click(size));
      },
    );
  }

  Widget _ball(Size size) {
    return GetBuilder<InclinationController>(
      id: 'ball',
      builder: (_) => Positioned(
        bottom: _.move(_.degrees, Size(size.width, size.height)),
        left: (size.width * 0.5) - (size.height * 0.02766),
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: size.height * 0.05,
          width: size.height * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _.color,
          ),
        ),
      ),
    );
  }

  Widget _goal(Size size) {
    return Positioned(
      top: (size.height * 0.125+size.height*0.265),
      left: (size.width * 0.5) - (size.height * 0.038),
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        height: size.height * 0.07,
        width: size.height * 0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 2.0, color: Colors.white)),
      ),
    );
  }
}
class TrapezoidClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
  Path path = Path()
  ..lineTo(0, 0)
  ..lineTo(size.width*0.1875, size.height*0.95)
  ..quadraticBezierTo(size.width*0.1875, size.height, size.width*0.5, size.height)
  ..quadraticBezierTo(size.width*0.8125, size.height, size.width*0.8125, size.height*0.95)
  ..lineTo(size.width, 0)
  ..lineTo(0, 0);
  return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}