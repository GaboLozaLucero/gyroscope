import 'package:degrees/controllers/congrats_controller.dart';
import 'package:degrees/pages/compass_page.dart';
import 'package:degrees/pages/inclination_page.dart';
import 'package:degrees/pages/lnbf_page.dart';
import 'package:degrees/widgets/background_border.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:degrees/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CongratsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = Get.arguments[0];
    // final size = Size(411.4, 798.9);
    return Scaffold(
      appBar: AppBar(
          title: Text('BestSat', style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold) ),
          centerTitle: true,
        ),
      body: SafeArea(
        child: GetBuilder<CongratsController>(
          init: CongratsController(),
          initState: (_) {},
          builder: (_) {
            return Stack(
              
              children: [
                  BackgroundBorder(size: size),
                  Positioned(
                    top: size.height*0.083,
                    left: size.width*0.25,
                    child: Container(
                      width: size.width*0.54,
                      child: Text('Felicidades, lo lograste!\nPuedes regresar al menú principal o volver a empezar la calibración',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.greenAccent,
                        
                      ),))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height*0.1,),
                      Container(                          
                            width: double.infinity,
                            
                            child: _.riveArtboard == null
                                    ? const SizedBox()
                                  : Rive(artboard: _.riveArtboard, fit: BoxFit.scaleDown,),
                                  height: size.height*0.6,
                          ),
                    ],
                  ),
                  
                  NextButton(
                    activated: true,          
                    nextPage: InclinationPage(),
                    onPressed: () =>
                    Get.off(() => LnbfPage(), transition: Transition.zoom, arguments: [size]),
                    message: 'Volver a Empezar',
                    size: size,
                    )
        ]
        );
        }
      
    )
    )
    );
  
  
  }}