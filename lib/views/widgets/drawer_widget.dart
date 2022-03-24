import 'package:customerapp/views/pages/Rider/r_accountSetting/r_accountSetting.dart';
import 'package:customerapp/views/pages/Rider/rider_earning/rr_earning.dart';
import 'package:customerapp/views/pages/Rider/rider_order/rr_orders.dart';
import 'package:customerapp/views/pages/chatScreens/chat_main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget drawer_widget(context) {
  return Drawer(
    child: ListView(padding: EdgeInsets.all(10.0),
        // children: _listViewData
        //     .map((data) => ListTile(
        //           title: Text(data),
        //         ))
        //     .toList(),
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RAccountSetting()),
                        );
                      },
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                              image: AssetImage(
                                  "assets/r_assets/images/Setting.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Account Setting",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.black,
                              ))),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          // Text("\$87.00",
                          //     style: GoogleFonts.ubuntu(
                          //         textStyle: TextStyle(
                          //       fontWeight: FontWeight.w500,
                          //       fontSize: 17,
                          //       color: Colors.red,
                          //     ))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 5),
                      child: Divider(
                        color: Colors.grey[100],
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    // 2nd
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RROrderPage()),
                        );
                      },
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage("assets/images/Bag.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Order History",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.black,
                              ))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Divider(
                        color: Colors.grey[100],
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),

                    // 4th
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RR_Earning()),
                        );
                      },
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage("assets/images/Wallet.png")),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Earnings",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.black,
                              ))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Divider(
                        color: Colors.grey[100],
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    // 5rd
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatMainScreen()),
                        );
                      },
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image:
                                AssetImage("assets/r_assets/images/Chat.png"),
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Chat",
                              style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.black,
                              ))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Divider(
                        color: Colors.grey[100],
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                  ],
                ),
              ))
        ]),
  );
}
