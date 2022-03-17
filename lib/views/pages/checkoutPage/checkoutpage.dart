import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum BestBeverages { Coke, Pepsi, Gormet }

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  BestBeverages? _site = BestBeverages.Coke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/Vector.png")),
                  SizedBox(
                    width: displayWidth(context) * 0.3,
                  ),
                  Text(
                    "Checkout",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // status bar
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
              height: displayHeight(context) / 1.1567,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Address detials row
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address details",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                          ),
                          Text(
                            "change",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(237, 41, 57, 1),
                            )),
                          ),
                        ],
                      ),
                    ),
                    // address details container
                    Container(
                      margin:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                      height: displayHeight(context) / 5,
                      width: displayWidth(context),
                      decoration: Constants.containerstyle(),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10.0,
                          left: displayWidth(context) / 2 * 0.17,
                          // right: displayWidth(context) / 2 * 0.17,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // margin: EdgeInsets.only(
                              //   top: 10.0,
                              //   left: displayWidth(context) / 2 * 0.17,
                              //   // right: displayWidth(context) / 2 * 0.17,
                              // ),
                              child: Text("Emma Sultan",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 1)))),
                            ),
                            // divider line
                            Container(
                              margin: EdgeInsets.only(
                                // left: displayWidth(context) / 2 * 0.17,
                                right: displayWidth(context) / 2 * 0.17,
                              ),
                              child: Divider(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                thickness: 0.5,
                              ),
                            ),
                            Container(
                              // margin: EdgeInsets.only(
                              //   left: displayWidth(context) / 2 * 0.17,
                              // ),
                              child: Text(
                                  "Unit 10, 2F, 123 Street, Toronto 3200",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 1)))),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, right: 30.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery Time",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 1)))),
                                  Text("08:00 AM",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(
                                                  237, 41, 57, 1))))
                                ],
                              ),
                            ),
                            // divider line
                            Container(
                              margin: EdgeInsets.only(
                                // left: displayWidth(context) / 2 * 0.17,
                                right: displayWidth(context) / 2 * 0.17,
                              ),
                              child: Divider(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                thickness: 0.5,
                              ),
                            ),
                            Text("+9813120851601",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(0, 0, 0, 1))))
                          ],
                        ),
                      ),
                    ),
                    // Payment method row
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment Method",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                          ),
                          Text(
                            "add",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(237, 41, 57, 1),
                            )),
                          ),
                        ],
                      ),
                    ),
                    // Payment method  container
                    Container(
                      margin:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                      height: displayHeight(context) / 5.5,
                      width: displayWidth(context),
                      decoration: Constants.containerstyle(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 32.0),
                            child: ListTile(
                              title: Text(
                                'Cash on Delivery',
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(0, 0, 0, 1))),
                              ),
                              leading: Radio(
                                activeColor: Color.fromRGBO(237, 41, 57, 1),
                                value: BestBeverages.Pepsi,
                                groupValue: _site,
                                onChanged: (BestBeverages? value) {
                                  setState(() {
                                    _site = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          // divider line
                          Container(
                            margin: EdgeInsets.only(
                              left: displayWidth(context) / 2 * 0.17,
                              right: displayWidth(context) / 2 * 0.17,
                            ),
                            child: Divider(
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                              thickness: 0.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Wallet',
                                    style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(0, 0, 0, 1))),
                                  ),
                                  Text("Not Enough Money",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.5)))),
                                ],
                              ),
                              leading: Radio(
                                activeColor: Color.fromRGBO(237, 41, 57, 1),
                                value: BestBeverages.Coke,
                                groupValue: _site,
                                onChanged: (BestBeverages? value) {
                                  setState(() {
                                    _site = value;
                                  });
                                },
                              ),
                              trailing: Text(
                                "\$87.0",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(237, 41, 57, 1))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // promo code heading
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Text(
                        "Promo Code",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        height: displayHeight(context) / 14,
                        width: displayWidth(context),
                        decoration: Constants.containerstyle(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Enter Promo Code",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 0.5))),
                          ),
                        )),
                    Container(
                      height: displayHeight(context) / 2.5,
                      width: displayWidth(context),
                      margin: EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0),
                      decoration: Constants.containerstyle(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 28.0, right: 28.0, top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sub Total",
                                    style: Constants.rowtextstyling()),
                                Text(
                                  "CAD94.21",
                                  style: Constants.rowtextstyling(),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 28.0, right: 28.0, top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Cost",
                                    style: Constants.rowtextstyling()),
                                Text(
                                  "CAD 0.0",
                                  style: Constants.rowtextstyling(),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 28.0, right: 28.0, top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Discount",
                                    style: Constants.rowtextstyling()),
                                Text(
                                  "CAD 0.0",
                                  style: Constants.rowtextstyling(),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: displayWidth(context) / 2 * 0.17,
                              right: displayWidth(context) / 2 * 0.17,
                            ),
                            child: Divider(
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                              thickness: 0.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 28.0, right: 28.0, top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total",
                                    style: Constants.rowtextstyling()),
                                Text(
                                  "CAD 94.21",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(237, 41, 57, 1))),
                                )
                              ],
                            ),
                          ),
                          // confirm order button
                          Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(left: 28, right: 28, top: 28),
                            height: displayHeight(context) / 2 * 0.16,
                            width: displayWidth(context),
                            decoration: Constants.buttonstyle(),
                            child: Text(
                              "Confirm Order",
                              style: Constants.loginbuttonstyle(),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
