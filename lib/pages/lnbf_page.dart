import 'package:degrees/controllers/lnbf_controller.dart';
import 'package:degrees/pages/home_page.dart';
import 'package:degrees/widgets/background_border.dart';
import 'package:degrees/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class LnbfPage extends StatelessWidget {
  const LnbfPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Size(411.4, 798.9);
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
              Positioned(
                  left: size.width*0.3,
                  top: size.height*0.3,
                  child: Container(
                  width: size.width*0.4,
                  child: _.riveArtboard == null
                          ? const SizedBox()
                        : Rive(artboard: _.riveArtboard, fit: BoxFit.cover,),
                        height: size.height*0.2,
                ),
              ),
              Positioned(
                left: size.width*0.05,
                  top: size.height*0.2,
                child: Container(
                width: size.width*0.9,
                child: Image(
                  image: AssetImage('assets/rotation_arrows.png'),
                  fit: BoxFit.cover,),
              )),

              NextButton(activated: true, nextPage: HomePage(), onPressed: (){Get.to(()=>HomePage());}, size: size)
            ]
          ),
        ),
      );}
      );
      }
      }