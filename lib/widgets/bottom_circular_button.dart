import 'package:flutter/material.dart';

class circular_button extends StatelessWidget {
  circular_button(
      {super.key, required this.size, required this.icon, this.onpressed});
  VoidCallback? onpressed;
  final double size;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.all(8.0),
      constraints: BoxConstraints(minWidth: size),
      onPressed: onpressed,
      child: icon,
      elevation: 2.0,
      fillColor: Colors.white,
      shape: CircleBorder(),
    );
  }
}
