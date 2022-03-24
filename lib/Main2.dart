import 'package:customerapp/views/pages/Rider/calling_screen/rider_calling_screen.dart';
import 'package:customerapp/views/pages/Rider/r_otp_screen/r_otp_screen.dart';
import 'package:customerapp/views/pages/Rider/rr_signup/rr_signUp.dart';
import 'package:customerapp/views/pages/Rider_or_Customer_screen/rider_customer_screen.dart';
import 'package:customerapp/views/pages/firstScreen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Main_2 extends StatelessWidget {
  const Main_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FirebaseAuth.instance.currentUser == null
            ? FirstScreen()
            : Rider_calling_screen());
  }
}
