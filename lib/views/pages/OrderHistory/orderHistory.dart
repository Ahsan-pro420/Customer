import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/views/widgets/tab_bar_view.dart';

import 'orderdetails.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                      width: displayWidth(context) * 0.25,
                    ),
                    Text(
                      "Order History",
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
              //search bar
              Container(
                margin: EdgeInsets.only(top: 25),
                height: displayHeight(context) * 0.066,
                width: displayWidth(context) / 1.17,
                decoration: Constants.containerstyle(),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Image.asset("assets/images/Search.png"),
                    suffixIcon: Image.asset("assets/images/Filter.png"),
                  ),
                ),
              ),
              // list data
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderDetails()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  height: displayHeight(context) * 0.14,
                  width: displayWidth(context) / 1.17,
                  decoration: Constants.containerstyle(),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, left: 8.0),
                            child:
                                Image.asset("assets/images/foodimages/kfc.png"),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.035,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "KFC",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Mighty Zinger",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(154, 154, 157, 1),
                              )),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              "17/5/2021, 22:32",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(154, 154, 157, 1),
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.08,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 40),
                            child: Text(
                              "\$80.00",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(237, 41, 57, 1),
                              )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderDetails()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  height: displayHeight(context) * 0.14,
                  width: displayWidth(context) / 1.17,
                  decoration: Constants.containerstyle(),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, left: 8.0),
                            child:
                                Image.asset("assets/images/foodimages/kfc.png"),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.035,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "KFC",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Mighty Zinger",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(154, 154, 157, 1),
                              )),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              "17/5/2021, 22:32",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(154, 154, 157, 1),
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.08,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 40),
                            child: Text(
                              "\$80.00",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(237, 41, 57, 1),
                              )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderDetails()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  height: displayHeight(context) * 0.14,
                  width: displayWidth(context) / 1.17,
                  decoration: Constants.containerstyle(),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, left: 8.0),
                            child:
                                Image.asset("assets/images/foodimages/kfc.png"),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.035,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "KFC",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Mighty Zinger",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(154, 154, 157, 1),
                              )),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              "17/5/2021, 22:32",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(154, 154, 157, 1),
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.08,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, left: 40),
                            child: Text(
                              "\$80.00",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(237, 41, 57, 1),
                              )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
