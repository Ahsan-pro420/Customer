import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/utills/customtextbutton.dart';
import 'package:customerapp/views/pages/brandPage/brandpage.dart';
import 'package:customerapp/views/pages/checkoutPage/checkoutpage.dart';

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 40.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset("assets/images/Vector.png")),
                    SizedBox(
                      width: displayWidth(context) * 0.1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cart",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          "Restaurant Name",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black,
                      ),
                      child: Text(
                        "1",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                          color: Colors.white,
                        )),
                      ),
                    ),
                    Container(
                      height: 5,
                      width: displayWidth(context) / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.blue[500],
                      ),
                    ),
                    Container(
                      height: 16,
                      width: 16,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black,
                      ),
                      child: Text(
                        "2",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                          color: Colors.white,
                        )),
                      ),
                    ),
                    Container(
                      height: 5,
                      width: displayWidth(context) / 2.5,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                      ),
                    ),
                    Container(
                      height: 16,
                      width: 16,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black,
                      ),
                      child: Text(
                        "3",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: displayHeight(context) * 0.31,
                width: displayWidth(context) / 1.17,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              // builder: (context) => BrandPage()
                              builder: (context) => BrandPage()),
                        );
                      },
                      child: Container(
                        width: displayWidth(context) / 2.2,
                        // width: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/foodimages/food1.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 5),
                              child: Text(
                                "Trending Now",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: Text(
                                "Brand Name",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, top: 5),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/Star.png"),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "4.2 (12k)",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 5),
                              child: Text(
                                "Product information",
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 5, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$30",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              // builder: (context) => BrandPage()
                              builder: (context) => BrandPage()),
                        );
                      },
                      child: Container(
                        width: displayWidth(context) / 2.2,
                        // width: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/foodimages/food1.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 5),
                              child: Text(
                                "Trending Now",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: Text(
                                "Brand Name",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, top: 5),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/Star.png"),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "4.2 (12k)",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 5),
                              child: Text(
                                "Product information",
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 5, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$30",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              // builder: (context) => BrandPage()
                              builder: (context) => BrandPage()),
                        );
                      },
                      child: Container(
                        width: displayWidth(context) / 2.2,
                        // width: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/foodimages/food1.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 5),
                              child: Text(
                                "Trending Now",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: Text(
                                "Brand Name",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, top: 5),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/Star.png"),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "4.2 (12k)",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 5),
                              child: Text(
                                "Product information",
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 5, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$30",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              // builder: (context) => BrandPage()
                              builder: (context) => BrandPage()),
                        );
                      },
                      child: Container(
                        width: displayWidth(context) / 2.2,
                        // width: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/foodimages/food1.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 5),
                              child: Text(
                                "Trending Now",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: Text(
                                "Brand Name",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, top: 5),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/Star.png"),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "4.2 (12k)",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 5),
                              child: Text(
                                "Product information",
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0, top: 5, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$30",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: displayHeight(context) * 0.3,
                width: displayWidth(context) / 1.17,
                decoration: Constants.containerstyle(),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 24.0, right: 22.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Name",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldstyle(),
                            ),
                          ),
                          Text(
                            "1x",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldstyle(),
                            ),
                          ),
                          Text(
                            "\$86.00",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldstyle(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Divider(
                          color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                          height: 0.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub Total",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                          Text(
                            "\$86.00",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Fee",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                          Text(
                            "\$6.00",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Incl.Tax",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                          Text(
                            "\$3.00",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blacksmallboldstyle(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 14.0),
                        child: Divider(
                          color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                          height: 0.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total (Incl.Gst)",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldstyle(),
                            ),
                          ),
                          Text(
                            "\$95.00",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldstyle(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.08,
              ),
              CustomTextButton(
                buttonName: 'Review payment and address',
                buttonTextStyle:
                    GoogleFonts.ubuntu(textStyle: Constants.loginbuttonstyle()),
                buttoncolor: Constants.black_light,
                height: _height * 0.078,
                width: displayWidth(context) * 0.9,
                highlightColor: Constants.black_light,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                  );
                },
                textStyle: TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
