import 'package:flutter/material.dart';

class FirstLayer extends StatefulWidget {
  const FirstLayer({Key? key}) : super(key: key);

  @override
  _FirstLayerState createState() => _FirstLayerState();
}

class _FirstLayerState extends State<FirstLayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        // gradient: LinearGradient(
        //       colors: [
        //         Color(0xFF4c41a3),
        //         Color(0xFF1f186f)
        //       ])
      ),
    );
  }
}
