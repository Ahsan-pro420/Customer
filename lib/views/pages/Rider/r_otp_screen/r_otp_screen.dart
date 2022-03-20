import 'dart:async';

import 'package:customerapp/utills/customtextbutton.dart';
import 'package:customerapp/views/pages/Rider/calling_screen/rider_calling_screen.dart';
import 'package:customerapp/views/pages/Rider/r_HomeScreen/r_orders.dart';
import 'package:customerapp/views/pages/Rider/r_signin/r_sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';

import 'package:pinput/pinput.dart';

class R_OTPSCREEN extends StatefulWidget {
  final String RR_phone;
  R_OTPSCREEN(this.RR_phone);

  @override
  _R_OTPSCREENState createState() => _R_OTPSCREENState();
}

class _R_OTPSCREENState extends State<R_OTPSCREEN> {
  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  String RR_pinf = "";
  late String _RRverificationCode;

  // String pppin = "";
  var _resendToken;
  PinTheme defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  // final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  // late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  // final BoxDecoration pinPutDecoration = BoxDecoration(
  //   // color: const Color.fromRGBO(255, 255, 255, 1),
  //   // borderRadius: BorderRadius.circular(10.0),
  //   border: Border(
  //     bottom: BorderSide(width: 1, color: Colors.black),
  //     // color: const Color.fromRGBO(126, 203, 224, 1),
  //   ),
  // );
  // @override
  // void initState() {
  //   super.initState();
  //   _verifyPhone();
  // }

  // _verifyPhone() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: '${widget.phone}',
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await FirebaseAuth.instance
  //             .signInWithCredential(credential)
  //             .then((value) async {
  //           if (value.user != null) {
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => Rider_calling_screen()),
  //                 (route) => false);
  //           }
  //         });
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         print(e.message);
  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text("verification Failed.")));
  //       },
  //       codeSent: (String verficationID, int? resendToken) {
  //         setState(() {
  //           _verificationCode = verficationID;
  //           ScaffoldMessenger.of(context)
  //               .showSnackBar(SnackBar(content: Text('code sent')));
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationID) {
  //         setState(() {
  //           _verificationCode = verificationID;
  //         });
  //       },
  //       timeout: Duration(seconds: 10));
  // }

  // final _formKey = GlobalKey<FormState>();

  void resend_timer_function() {
    setState(() {
      if (RR_resendtimer == true) {
        RR_resendtimer = false;
        RR_resend_color = Colors.black;

        print("$RR_resendtimer");
        Timer(
            Duration(seconds: 35),
            () => setState(() {
                  RR_resendtimer = true;
                  RR_resend_color = Colors.red;
                }));
      }
    });
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.RR_phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              //remove comment
              // final String _currentTimeZone =
              //     await FlutterNativeTimezone.getLocalTimezone();
              // _firebaseMessaging.getToken().then((token) {
              //   ScaffoldMessenger.of(context)
              //       .showSnackBar(SnackBar(content: Text("/$token")));
              // });
              // ScaffoldMessenger.of(context)
              //     .showSnackBar(SnackBar(content: Text("/$_currentTimeZone")));

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Rider_calling_screen()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("verification Failed.")));
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _RRverificationCode = verficationID;
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('code has been sent.')));
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _RRverificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 25),
        forceResendingToken: _resendToken);
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: displayHeight(context) / 2,
              width: displayWidth(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Image(
                      image:
                          AssetImage("assets/r_assets/images/rider_logo.png")),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Text(
                    "OTP VERIFICATION",
                    style: GoogleFonts.ubuntu(
                      textStyle: Constants.otp1style(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.RR_phone,
                    style: GoogleFonts.ubuntu(
                      textStyle: Constants.otp1style(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.045,
                  ),
                  Text(
                    "Enter the OTP sent on your phone number",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //second part of the screen
            Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.12,
                  ),
// pin put

                  Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(30, 60, 87, 1),
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 162, 182, 199)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    focusedPinTheme: defaultPinTheme.copyDecorationWith(
                      border:
                          Border.all(color: Color.fromARGB(255, 144, 156, 168)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration?.copyWith(
                        color: Color.fromRGBO(234, 239, 243, 1),
                      ),
                    ),
                    showCursor: true,
                    onCompleted: (value) => (RR_pinf = value),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: 28, left: 20, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Didn't received code?",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              // onPrimary: Colors.amber,
                              primary: Colors.white,
                              onSurface: Colors.white,
                              // Constants.bg_grey,
                              onPrimary: Colors.red,
                              animationDuration: Duration(seconds: 5)),

                          onPressed: RR_resendtimer
                              ? (() => setState(() {
                                    resend_timer_function();
                                    _verifyPhone();
                                  }))
                              : null,
                          //  resendtimer
                          //     ? () => print("$resendtimer")
                          //     : () => print("$resendtimer"),
                          child: Text(
                            "resend",
                            style: TextStyle(color: RR_resend_color),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.3,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: CustomTextButton(
                      buttonName: 'VERIFY OTP',
                      buttonTextStyle: GoogleFonts.ubuntu(
                          textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: Constants.black_light,
                      height: _height * 0.066,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () async {
                        print(RR_pinf);

                        // (pppin) async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(
                                  PhoneAuthProvider.credential(
                                      verificationId: _RRverificationCode,
                                      smsCode: RR_pinf))
                              .then((value) async {
                            if (value.user != null) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Rider_calling_screen()),
                                  (route) => false);
                            }
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid OTP.')));
                          // FocusScope.of(context).unfocus();
                          // _scaffoldkey.currentState
                          //     .showSnackBar(SnackBar(content: Text('invalid OTP')));
                        }

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => OrderPage()),
                        // );
                      },
                      textStyle: TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
