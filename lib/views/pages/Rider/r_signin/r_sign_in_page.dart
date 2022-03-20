import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:customerapp/views/pages/Rider/r_otp_screen/r_otp_screen.dart';
import 'package:customerapp/views/pages/Rider/rr_signup/rr_signUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/utills/customtextbutton.dart';

bool RR_resendtimer = false;
var RR_resend_color = Colors.black;

class R_SignIn extends StatefulWidget {
  const R_SignIn({Key? key}) : super(key: key);

  @override
  _R_SignInState createState() => _R_SignInState();
}

class _R_SignInState extends State<R_SignIn> {
  TextEditingController RR_controllernumber = TextEditingController();
  String RR_code = '+92';
  String RR_phoneNumber = "";
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
                    "Welcome, Let's Start",
                    style: GoogleFonts.ubuntu(
                      textStyle: Constants.welcomestyle(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Text(
                    "login",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.033,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create an Account",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 7),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            // onPrimary: Colors.amber,
                            primary: Colors.white,
                            onSurface: Colors.white,
                            // Constants.bg_grey,
                            onPrimary: Colors.red,
                            animationDuration: Duration(seconds: 5)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RR_Sign_up()),
                          );
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //second part of the screen
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.08,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Text(
                            "Contry Code",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.4))),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CountryCodePicker(
                              // showDropDownButton: true,
                              initialSelection: 'PK',
                              enabled: true,
                              showDropDownButton: true,

                              onChanged: (CountryCode ccode) {
                                setState(() {
                                  RR_code = ccode.toString();
                                });
                              },
                            ),
                            // Text("Singapore"),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            // Icon(Icons.arrow_drop_down_sharp),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 12,
                          ),
                          // padding: EdgeInsets.only(top: -10),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Text("Phone Number"),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: TextFormField(
                        controller: RR_controllernumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter Phone Number ',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      )),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.1,
                  ),
                  // controllernumber.text.isEmpty ? Container(
                  //   margin: EdgeInsets.only(left: 35, right: 35),
                  //   child: CustomTextButton(
                  //     buttonName: 'SEND OTP',
                  //     buttonTextStyle: GoogleFonts.ubuntu(
                  //         textStyle: Constants.loginbuttonstyle()),
                  //     buttoncolor: Constants.black_light.withOpacity(0.4),
                  //     height: _height * 0.066,
                  //     width: displayWidth(context) * 0.9,
                  //     highlightColor: Constants.black_light,
                  //     onPressed: () {
                  //       // Navigator.push(
                  //       //   context,
                  //       //   MaterialPageRoute(builder: (context) => SignIn()
                  //       //   ),
                  //       // );
                  //     }, textStyle: TextStyle(

                  //   ),
                  //   ),
                  // ):
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: CustomTextButton(
                      buttonName: 'SEND OTP',
                      buttonTextStyle: GoogleFonts.ubuntu(
                          textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: Constants.black_light,
                      height: _height * 0.066,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () {
                        setState(() {
                          RR_phoneNumber = RR_code + RR_controllernumber.text;
                          Timer(
                              Duration(seconds: 35),
                              () => {
                                    RR_resendtimer = true,
                                    RR_resend_color = Colors.red
                                  });
                        });
                        if (RR_controllernumber.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    R_OTPSCREEN(RR_phoneNumber)),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Enter Your Phone Number.")));
                        }
                        // Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => ),
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
