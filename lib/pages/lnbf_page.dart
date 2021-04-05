import 'package:degrees/controllers/lnbf_controller.dart';
import 'package:degrees/pages/compass_page.dart';
import 'package:degrees/pages/home_page.dart';
import 'package:degrees/widgets/background_border.dart';
import 'package:degrees/widgets/next_button.dart';
import 'package:degrees/widgets/step_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class LnbfPage extends StatelessWidget {
  const LnbfPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Get.arguments[0];
    return GetBuilder<LnbfController>(
      init: LnbfController(),
      initState: (_) {},
      builder: (_) {
        _.bodySize(size);
        return Scaffold(
            appBar: AppBar(
              title: Text('BestSat', style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold) ),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed :
       () {
                  _.instructions(size);
                })
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              BackgroundBorder(size: size),
              StepIcon(size: size,
               image: AssetImage('assets/lnbf_icon.png'),
                step: 1,
                onTap: (){_.instructions(size);}),
              Positioned(
                  left: size.width*0.15,
                  top: size.height*0.3,
                  child: Container(
                  
                  width: size.width*0.7,
                  child: _.riveArtboard == null
                          ? const SizedBox()
                        : Rive(artboard: _.riveArtboard, fit: BoxFit.cover,),
                        height: size.height*0.35,
                ),
              ),
              

              NextButton(activated: true, nextPage: HomePage(), onPressed: (){Get.to(()=>CompassPage(), arguments: [size]);}, size: size, message: 'Ir al paso 2',)
            ]
          ),
        ),
      );}
      );
      }
      }