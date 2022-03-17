import 'package:flutter/material.dart';
import 'package:customerapp/views/pages/HomeScreen/secondlayer.dart';
import 'package:customerapp/views/pages/HomeScreen/thirdlayer.dart';

import 'firstlayer.dart';
import 'homepagelayer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FirstLayer(),
          SecondLayer(),
          ThirdLayer(),
          HomePageLayer(),
        ],
      ),
    );
  }
}
