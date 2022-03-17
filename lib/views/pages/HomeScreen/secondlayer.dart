import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class SecondLayer extends StatefulWidget {
  const SecondLayer({Key? key}) : super(key: key);

  @override
  _SecondLayerState createState() => _SecondLayerState();
}
_SecondLayerState? secondLayerState;
class _SecondLayerState extends State<SecondLayer> {


  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    secondLayerState = this;
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: Duration(milliseconds: 550),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey[100]),
        child: Column(
          children: [
            Row(children: [],)],)
    );
  }
}
