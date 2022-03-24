import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/utills/customtextbutton.dart';
import 'package:customerapp/views/pages/Rider/r_signin/r_sign_in_page.dart';
import 'package:customerapp/views/pages/signin/sign_in_page.dart';
import 'package:customerapp/views/widgets/wavy_first_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rider_or_Customer extends StatelessWidget {
  const Rider_or_Customer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            WavyHeaderImage(),
            SizedBox(
              height: displayHeight(context) * 0.15,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.grey;
                        // else if (states.contains(MaterialState.disabled))
                        //   return Constants.black_light;
                        return Constants
                            .black_light; // Use the component's default.
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(color: Colors.black)))),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => R_SignIn()),
                    // );
                  },
                  child: Text(
                    "Customer",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  // CustomTextButton(
                  //   buttonName: 'Customer',
                  //   buttonTextStyle:
                  //       GoogleFonts.ubuntu(textStyle: Constants.loginbuttonstyle()),
                  //   buttoncolor: Constants.black_light,
                  //   height: _height * 0.07,
                  //   width: displayWidth(context) * 0.9,
                  //   highlightColor: Constants.black_light,
                  //   onPressed: () {
                  //     // Navigator.pop(context);
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(builder: (context) => SignIn()),
                  //     // );
                  //   },
                  //   textStyle: TextStyle(),
                  // ),
                )),
            SizedBox(
              height: displayHeight(context) * 0.05,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.grey;
                        // else if (states.contains(MaterialState.disabled))
                        //   return Constants.black_light;
                        return Constants
                            .black_light; // Use the component's default.
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(color: Colors.black)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => R_SignIn()),
                    );
                  },
                  child: Text(
                    "Rider",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),

                  // Container(
                  //   child: CustomTextButton(
                  //     buttonName: 'Rider',
                  //     buttonTextStyle:
                  //         GoogleFonts.ubuntu(textStyle: Constants.loginbuttonstyle()),
                  //     buttoncolor: Constants.black_light,

                  //     height: _height * 0.07,
                  //     width: displayWidth(context) * 0.9,
                  //     highlightColor: Constants.black_light,
                  //     onPressed: () {
                  //       // Navigator.pop(context);
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => R_SignIn()),
                  //       );
                  //     },
                  //     textStyle: TextStyle(),
                  //   ),
                  // )
                ))
          ],
        ),
      ),
    );
  }
}
