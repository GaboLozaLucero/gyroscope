import 'package:degrees/pages/compass_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size0 = MediaQuery.of(context).size;
    final appBar = AppBar(
      title: Text('BestSat', style: TextStyle(fontSize: 20),),
      centerTitle: true,
    );
    final height = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    final size = Size(size0.width, height);
    //print(size);
    return Scaffold(
      appBar: appBar,
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: size.width*0.069, vertical: size.height * 0.091),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _menuButton('assets/satellite_dish.png', 'Alinear Antena', size,
                    () {
                  Get.off(() => CompassPage(),
                      transition: Transition.rightToLeft, arguments: [size]);
                }),
                Expanded(
                    child: SizedBox(
                  height: 0,
                )),
                _menuButton('assets/edit_devices.png', 'Editar Dispositivos',
                    size, () {}),
              ],
            ),
            SizedBox(
              height: size.height * 0.055,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _menuButton('assets/upgrade_device.png',
                    'Actualizar Dispositivo', size, () {}),
                Expanded(
                    child: SizedBox(
                  height: 0,
                )),
                _menuButton('assets/share.png', 'Nuestras redes y contactos',
                    size, () {}),
              ],
            ),
            SizedBox(
              height: size.height * 0.093,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text('Ver tutorial'),
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all<Size>(Size(double.infinity, size.height*0.0525)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.greenAccent),
                side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: Colors.greenAccent, width: 4.0)),
                shape:
                    MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _menuButton(String asset, String description, Size size,
      GestureTapCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.3042,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200]),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(asset),
              height: size.height*0.11,
            ),
            SizedBox(
              height: size.height* 0.03,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: size.height* 0.047,
            )
          ],
        ),
      ),
    );
  }
}
