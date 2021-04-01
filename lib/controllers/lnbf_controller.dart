import 'package:degrees/widgets/instructions.dart';
import 'package:degrees/widgets/instructions_text_span.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
class LnbfController extends GetxController {
  Size _size;

  Artboard _riveArtboard;
  RiveAnimationController _controller;

  bool get isPlaying => _controller?.isActive ?? false;
  Artboard get riveArtboard => _riveArtboard;
  void bodySize(Size size) => _size = size;

  @override
  void onInit() {
    super.onInit();
    _animation();

  }

  @override
  void onReady() {
    
    super.onReady();
    instructions(_size);
  }

  void _animation() { rootBundle.load('assets/lnbf.riv').then(
      (data) async {
        final file = RiveFile();
        if (file.import(data)) {
          final artboard = file.mainArtboard;
          artboard.addController(_controller = SimpleAnimation('Animation 1'));

          _riveArtboard = artboard;
           
          update();
              }});
              }

  void instructions(Size size) {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white),
      child: Instructions(
          step: 1,
          title: 'LNBF ',
          size: size,
          instruction: RichText(
            textAlign: TextAlign.justify,
              text: TextSpan(
                  text: 'Imagina que la parte inferior del ',
                  style: GoogleFonts.quicksand(color: Colors.black),
                  
                  children: <TextSpan>[
                InstructionsTextSpan().boldText('LNBF '),
                InstructionsTextSpan().regularText('es una manecilla de reloj y gírala hasta que ésta apunte a los '),
                InstructionsTextSpan().boldText('22 '),
                InstructionsTextSpan().regularText('minutos. Cuando hayas finalizado, presiona el botón verde para continuar\n'),
                
              ])),
          assetLocation: 'assets/inclination_icon.png'),
    ));
  }
}