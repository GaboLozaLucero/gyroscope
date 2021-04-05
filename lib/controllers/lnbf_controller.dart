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
                  text: 'Utilizando el plato de la antena, ajusta el ',
                  style: GoogleFonts.quicksand(color: Colors.black),
                  
                  children: <TextSpan>[
                InstructionsTextSpan().boldText('LNBF '),
                InstructionsTextSpan().regularText('para que el cable coaxial se ajuste a '),
                InstructionsTextSpan().boldText('30 grados'),
                InstructionsTextSpan().regularText(', puedes utlizar esta imagen para guiarte. Cuando hayas finalizado, presiona el botón verde para continuar\n'),
                
              ])),
          assetLocation: 'assets/lnbf_icon.png'),
    ));
  }
}