import 'dart:async';
import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:customerapp/views/pages/Rider/r_otp_screen/r_otp_screen.dart';
import 'package:customerapp/views/pages/Rider/rr_signup/rr_signUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/utills/customtextbutton.dart';
import 'package:http/http.dart';

bool RR_resendtimer = false;
var RR_resend_color = Colors.black;
var login_state;

class R_SignIn extends StatefulWidget {
  const R_SignIn({Key? key}) : super(key: key);

  @override
  _R_SignInState createState() => _R_SignInState();
}

class _R_SignInState extends State<R_SignIn> {
  TextEditingController RR_controllernumber = TextEditingController();
  String RR_code = '+92';
  String RR_phoneNumber = "";

  // var login_data;

  void Rider_Sign_In_Post_Api(
    String phone_n,
  ) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://persecuted-admissio.000webhostapp.com/restaurant/rider_api/login.php'),
          body: {"rider_phone": phone_n});

      if (response.statusCode == 200) {
        login_state = null;
        var login_data = jsonDecode(response.body.toString());
        // print(login_data['token']);
        print('cal rider sign in successfully');
        print("${login_data} func");
        setState(() {
          login_state = login_data;
          print("${login_state} login state func");
        });
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void ttimer_resend_first() {
    setState(() {
      Timer(Duration(seconds: 35),
          () => {RR_resendtimer = true, RR_resend_color = Colors.red});
    });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: displayHeight(context) / 2 * 1.07,
              width: displayWidth(context),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.028,
                  ),
                  Image(
                      image:
                          AssetImage("assets/r_assets/images/rider_logo.png")),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.038,
                  ),
                  Text(
                    "Welcome, Let's Start",
                    style: GoogleFonts.ubuntu(
                      textStyle: Constants.welcomestyle(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.042,
                  ),
                  Text(
                    "login",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height * 0.030,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.015,
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
                    height: displayHeight(context) / 2 * 0.06,
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
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.015,
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black),
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.white;
                            // else if (states.contains(MaterialState.disabled))
                            //   return Constants.black_light;
                            return Constants
                                .black_light; // Use the component's default.
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      side: BorderSide(color: Colors.black)))),
                      onPressed: () {
                        setState(() {
                          RR_phoneNumber = RR_code + RR_controllernumber.text;
                        });
                        Rider_Sign_In_Post_Api(RR_phoneNumber);
                        Timer(
                            Duration(seconds: 5),
                            () => {
                                  print("${login_state} timer"),
                                  if (RR_controllernumber.text.isEmpty)
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text("Enter Phone Number.")))
                                    }
                                  else if (login_state.toString() == "0")
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Register Your Number First")))
                                    }
                                  else if (login_state != 0)
                                    {
                                      ttimer_resend_first(),
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                R_OTPSCREEN(RR_phoneNumber)),
                                      )
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Some thing gone wrong")))
                                    }
                                });
                      },
                      child: Text(
                        "Send OTP ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      //                      // textStyle: TextStyle(),
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
//Container(
                      //   margin: EdgeInsets.only(left: 35, right: 35),
                      //   child: CustomTextButton(
                      //     buttonName: 'SEND OTP',
                      //     buttonTextStyle: GoogleFonts.ubuntu(
                      //         textStyle: Constants.loginbuttonstyle()),
                      //     buttoncolor: Constants.black_light,
                      //     height: _height * 0.066,
                      //     width: displayWidth(context) * 0.9,
                      //     highlightColor: Constants.black_light,
                      //     onPressed: () {
                      //       setState(() {
                      //         RR_phoneNumber = RR_code + RR_controllernumber.text;
                      //         // Timer(
                      //         //     Duration(seconds: 35),
                      //         //     () => {
                      //         //           RR_resendtimer = true,
                      //         //           RR_resend_color = Colors.red
                      //         //         });
                      //       });
                      //       Rider_Sign_In_Post_Api(RR_phoneNumber);
                      //       // print("${login_data}on pressed");

                      //       Timer(
                      //           Duration(seconds: 5),
                      //           () => {
                      //                 print("${login_state} timer"),
                      //                 if (RR_controllernumber.text.isEmpty)
                      //                   {
                      //                     ScaffoldMessenger.of(context)
                      //                         .showSnackBar(SnackBar(
                      //                             content:
                      //                                 Text("Enter Phone Number.")))
                      //                   }
                      //                 else if (login_state.toString() == "0")
                      //                   {
                      //                     ScaffoldMessenger.of(context)
                      //                         .showSnackBar(SnackBar(
                      //                             content: Text(
                      //                                 "Register Your Number First")))
                      //                   }
                      //                 else if (login_state != 0)
                      //                   {
                      //                     ttimer_resend_first(),
                      //                     Navigator.push(
                      //                       context,
                      //                       MaterialPageRoute(
                      //                           builder: (context) =>
                      //                               R_OTPSCREEN(RR_phoneNumber)),
                      //                     )
                      //                   }
                      //                 else
                      //                   {
                      //                     ScaffoldMessenger.of(context)
                      //                         .showSnackBar(SnackBar(
                      //                             content: Text(
                      //                                 "Some thing gone wrong")))
                      //                   }
                      //               });

                      //     },
 