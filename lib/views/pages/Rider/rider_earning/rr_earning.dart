import 'dart:convert';

import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/views/pages/Rider/rider_earning/rr_earning_api_function.dart';
import 'package:customerapp/views/pages/Rider/rider_earning/rr_earning_widget.dart';
import 'package:customerapp/views/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

class RR_Earning extends StatefulWidget {
  const RR_Earning({Key? key}) : super(key: key);

  @override
  _RR_EarningState createState() => _RR_EarningState();
}

class _RR_EarningState extends State<RR_Earning> {
  var data;
  Future<void> get_E_Api() async {
    final response = await http.get(Uri.parse(
        "https://persecuted-admissio.000webhostapp.com/restaurant/rider_api/earning.php"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      // return data;
    }
  }

  GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey2,
      drawer: Drawer(
        child: drawer_widget(context),
      ),
      body: Container(
        //height: displayHeight(context) - kBottomNavigationBarHeight,
        width: displayWidth(context),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Image.asset("assets/images/Menu.png"),
                        // icon: Icon(Icons.menu, color: Color(0xFF1f186f),),
                        onPressed: () {
                          _scaffoldKey2.currentState!.openDrawer();
                        }),
                    // Image.asset("assets/images/Menu.png"),
                    SizedBox(
                      width: displayWidth(context) * 0.25,
                    ),
                    Text(
                      "Earnings",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      )),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Container(
                  child: FutureBuilder(
                      future: get_E_Api(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Container(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Earning_Widget(context, data["Monthly"],
                              data["Weekly"], data["Today"]);
                        }
                      })),
              Container(
                  child: FutureBuilder(
                      future: get_sales_data_api(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Container(
                              height: 500,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: Sales_Api_Data_List.length,
                              itemBuilder: (context, index) {
                                return RR_Earning_widget1(
                                    context,
                                    Sales_Api_Data_List[index].date.toString(),
                                    Sales_Api_Data_List[index]
                                        .orderId
                                        .toString(),
                                    Sales_Api_Data_List[index].time.toString(),
                                    Sales_Api_Data_List[index]
                                        .orderAmount
                                        .toString());
                              });
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
