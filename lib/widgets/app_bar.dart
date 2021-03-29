import 'package:flutter/material.dart';
class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget{
  
  const GlobalAppBar({
    Key key,
    @required this.size,
    @required this.infoDisplay, this.preferredSize
  }) : super(key: key);

  final Size size;
  final GestureTapCallback infoDisplay;
  @override
    final Size preferredSize;

  @override
  PreferredSizeWidget build(BuildContext context) {
    final Size size0 = MediaQuery.of(context).size;
    final appBar = AppBar(
      title: Text('BestSat'),
      centerTitle: true,
    );
    final height = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    final size = Size(size0.width, height);
    return AppBar(
      title: Text('BestSat'),
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: infoDisplay,)
      ],
    );
  }

   
}