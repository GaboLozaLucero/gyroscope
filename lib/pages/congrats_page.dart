import 'package:degrees/pages/inclination_page.dart';
import 'package:degrees/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class CongratsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final Size size = Get.arguments[0];
    return Scaffold(
      body: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: Text('Lo Lograste!!', 
                    style: TextStyle(
                      fontSize: 50.0, 
                      color: Colors.deepPurple),
                      ),
                        ),
                  Positioned(
                    bottom: size.height * 0.125,
              right: 10.0,
                                      child: NextButton(
                      activated: true, 
                      nextPage: InclinationPage(), 
                      onPressed: ()=> Get.off(()=> InclinationPage(), transition: Transition.zoom),
                      message: 'Volver a Empezar',),
                  )
                    ]
        ),
      ),
    );
  }
}