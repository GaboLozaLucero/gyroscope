import 'package:get/state_manager.dart';
import 'package:sensors/sensors.dart';


class CompassController extends GetxController {
  void gyro(){
    gyroscopeEvents.listen((GyroscopeEvent event) {
   print(event);
   update(); 
  });

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    gyro();
  }

}