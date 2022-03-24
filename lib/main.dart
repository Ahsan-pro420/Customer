import 'package:customerapp/Main2.dart';
import 'package:customerapp/views/pages/HomeScreen/HomeScreen.dart';
import 'package:customerapp/views/pages/Rider/calling_screen/rider_calling_screen.dart';
import 'package:customerapp/views/pages/Rider/r_HomeScreen/r_orders.dart';
import 'package:customerapp/views/pages/firstScreen/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var login = pref.containsKey("login");

  //for viewing only in portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MaterialApp(
    title: "Customer App",
    // home: ROrderPage(),
    home: Main_2(),
    debugShowCheckedModeBanner: false,
  ));
}
