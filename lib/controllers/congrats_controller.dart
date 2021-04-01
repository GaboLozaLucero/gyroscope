import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class CongratsController extends GetxController {

  Artboard _riveArtboard;
  RiveAnimationController _controller;

  bool get isPlaying => _controller?.isActive ?? false;
  Artboard get riveArtboard => _riveArtboard;


  @override
  void onInit() {
   
    super.onInit();
    _rocketLaunch();
  }

  void _rocketLaunch() { rootBundle.load('assets/rocket_reload.riv').then(
      (data) async {
        final file = RiveFile();
        if (file.import(data)) {
          final artboard = file.mainArtboard;
          artboard.addController(_controller = SimpleAnimation('Trigger'));
          _controller.isActiveChanged.addListener(() {
          if (!_controller.isActive) {           
            _riveArtboard = null;
            _inOrbit();
          } 
        });

          _riveArtboard = artboard;
           
          update();
        }
      },
    );}

  void _inOrbit() { rootBundle.load('assets/rocket_reload.riv').then(
      (data) async {
        final file = RiveFile();
        if (file.import(data)) {
          final artboard = file.mainArtboard;
          artboard.addController(_controller = SimpleAnimation('Loading'));
          _controller.isActiveChanged.addListener(() {
          if (!_controller.isActive) {           
            _riveArtboard = null;
            
          } 
        });

          _riveArtboard = artboard;
           
          update();
              }});
              }}
  
  