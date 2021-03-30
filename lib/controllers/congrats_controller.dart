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
    _loadAnimation();
  }

  void _loadAnimation() { rootBundle.load('assets/rocket_reload.riv').then(
      (data) async {
        final file = RiveFile();
        if (file.import(data)) {
          final artboard = file.mainArtboard;
          artboard.addController(_controller = SimpleAnimation('Trigger'));
          _controller.isActiveChanged.addListener(() {
          if (!_controller.isActive) {           
            artboard.removeController(_controller);
            _controller = SimpleAnimation('Loading');
          artboard.addController(_controller);
          } 
        });

          _riveArtboard = artboard;
           
          update();
        }
      },
    );}
  }
