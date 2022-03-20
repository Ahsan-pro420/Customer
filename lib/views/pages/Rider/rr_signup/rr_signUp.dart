import 'dart:async';
import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/utills/customtextbutton.dart';
import 'package:customerapp/views/pages/Rider/r_signin/r_sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class RR_Sign_up extends StatefulWidget {
  const RR_Sign_up({Key? key}) : super(key: key);

  @override
  State<RR_Sign_up> createState() => _RR_Sign_upState();
}

class _RR_Sign_upState extends State<RR_Sign_up> {
  TextEditingController RRR_controllernumber = TextEditingController();
  TextEditingController RRR_Name_controller = TextEditingController();
  String RRR_code = '+92';
  String RRR_phoneNumber = "";

  void Sign_Up_Post_Api(
    String name,
    String phone_n,
  ) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://persecuted-admissio.000webhostapp.com/restaurant/rider_api/signup.php'),
          body: {"rider_name": name, "rider_phone": phone_n});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Post Succesfull');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
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
                    "SignUp",
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
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            // margin: EdgeInsets.only(left: 35, right: 35),
                            child: TextFormField(
                          controller: RRR_Name_controller,
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter Name ',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        )),
                        SizedBox(
                          height: displayHeight(context) / 2 * 0.05,
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //     left: 12,
                        //   ),
                        //   // padding: EdgeInsets.only(top: -10),
                        //   child: Divider(
                        //     color: Colors.grey,
                        //   ),
                        // ),
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
                        CountryCodePicker(
                          // showDropDownButton: true,
                          initialSelection: 'PK',
                          enabled: true,
                          showDropDownButton: true,

                          onChanged: (CountryCode ccode) {
                            setState(() {
                              RRR_code = ccode.toString();
                            });
                          },
                        ),

                        TextFormField(
                          controller: RRR_controllernumber,
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.1,
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 35, right: 35),
                  //   child: Text("Phone Number"),
                  // ),

                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: CustomTextButton(
                      buttonName: 'Sign Up',
                      buttonTextStyle: GoogleFonts.ubuntu(
                          textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: Constants.black_light,
                      height: _height * 0.066,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () {
                        setState(() {
                          RRR_phoneNumber =
                              RRR_code + RRR_controllernumber.text;
                        });
                        print(RRR_phoneNumber);
                        print(RRR_Name_controller.text);

                        if (RRR_Name_controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Enter Your Name")));
                        } else if (RRR_controllernumber.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Enter Your Phone Number")));
                        } else {
                          Sign_Up_Post_Api(RRR_Name_controller.text.toString(),
                              RRR_phoneNumber);
                          // Sign_Up_Post_Api("ahsan", "+923072647909");
                          Timer(
                              Duration(seconds: 2),
                              () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => R_SignIn()),
                                    )
                                  });
                          // Timer(
                          //     Duration(seconds: 1),
                          //     () => {
                          //           RRR_Name_controller.clear(),
                          //           RRR_controllernumber.clear()
                          //         });
                        }

                        // if (RRR_controllernumber.text.isNotEmpty) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             R_OTPSCREEN(RR_phoneNumber)),
                        //   );
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text("Enter Your Phone Number.")));
                        // }
                      },
                      // Navigator.pop(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ),
                      // );

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
