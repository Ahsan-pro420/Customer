import 'package:customerapp/views/pages/HomeScreen/HomeScreen.dart';
import 'package:customerapp/views/pages/Rider/calling_screen/rider_calling_screen.dart';
import 'package:customerapp/views/pages/Rider/r_HomeScreen/r_orders.dart';
import 'package:customerapp/views/pages/firstScreen/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var login = pref.containsKey("login");

  runApp(MaterialApp(
    title: "Customer App",
    // home: ROrderPage(),
    home: login == false
        ? FirstScreen()
        : pref.getString("userType") == "Customer"
            ? HomeScreen()
            : Rider_calling_screen(),
    debugShowCheckedModeBanner: false,
  ));
}
