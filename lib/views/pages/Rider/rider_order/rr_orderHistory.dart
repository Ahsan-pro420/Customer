import 'dart:convert';

import 'package:customerapp/views/pages/Rider/rider_order/api_call_func.dart';
import 'package:customerapp/views/pages/Rider/rider_order/order_history_tile.dart';
import 'package:customerapp/views/widgets/r_tabButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

class RROrdersHistory extends StatefulWidget {
  @override
  _RROrdersHistoryState createState() => _RROrdersHistoryState();
}

class _RROrdersHistoryState extends State<RROrdersHistory> {
  int _selectedPage = 0;
  PageController? _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController?.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: displayHeight(context) - kBottomNavigationBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 20.0, left: 0),
            //   // child:
            //   //  Row(
            //   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   //   children: [
            //   //     // GestureDetector(
            //   //     //     onTap: () {
            //   //     //       Navigator.pop(context);
            //   //     //     },
            //   //     //     child: Image.asset("assets/images/Vector.png")),
            //   //     SizedBox(
            //   //       width: displayWidth(context) * 0.25,
            //   //     ),
            //   //     Center(
            //   //       child: Text(
            //   //         "Order History",
            //   //         style: GoogleFonts.ubuntu(
            //   //           textStyle: TextStyle(
            //   //             fontWeight: FontWeight.w400,
            //   //             fontSize: 18,
            //   //             color: Colors.black,
            //   //           ),
            //   //         ),
            //   //       ),
            //   //     ),
            //   //     SizedBox(
            //   //       width: displayWidth(context) * 0.25,
            //   //     ),
            //   //   ],
            //   // ),
            // ),
            //All&Complete&Failed

            Container(
              padding: EdgeInsets.only(
                top: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RTabButton(
                    text: "All",
                    pageNumber: 0,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      _changePage(0);
                    },
                  ),
                  RTabButton(
                    text: "Completed",
                    pageNumber: 1,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      print(order_history_active_list.length);
                      print("object");
                      _changePage(1);
                    },
                  ),
                  RTabButton(
                    text: "Failed",
                    pageNumber: 2,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      _changePage(2);
                    },
                  ),
                ],
              ),
            ),
            //search bar
            // Container(
            //   margin: EdgeInsets.only(top: 25),
            //   height: displayHeight(context) * 0.066,
            //   width: displayWidth(context) / 1.17,
            //   decoration: Constants.containerstyle(),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       border: InputBorder.none,
            //       prefixIcon: Image.asset("assets/images/Search.png"),
            //       suffixIcon: Image.asset("assets/images/Filter.png"),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: PageView(
                  onPageChanged: (int page) {
                    setState(() {
                      _selectedPage = page;
                    });
                  },
                  controller: _pageController,
                  children: [
                    //All Order History

                    //All

                    Container(
                      child: FutureBuilder(
                          future: get_order_history_api(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Container(
                                height: 30,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    // physics: NeverScrollableScrollPhysics(),
                                    itemCount: order_history_list.length,
                                    itemBuilder: (context, index) {
                                      return Order_history_tile_class(
                                          Cat_nam: "BBQ",
                                          prod_nam: order_history_list[index]
                                              .productName
                                              .toString(),
                                          ppricee: order_history_list[index]
                                              .totalAmount
                                              .toString(),
                                          ddatee: order_history_list[index]
                                              .date
                                              .toString(),
                                          iidd: order_history_list[index]
                                              .orderId
                                              .toString(),
                                          iimagee: order_history_list[index]
                                              .productImage1
                                              .toString(),
                                          nnew_pricee: order_history_list[index]
                                              .newPrice
                                              .toString(),
                                          nnet_amountt:
                                              order_history_list[index]
                                                  .netAmount
                                                  .toString(),
                                          ttaxx: order_history_list[index]
                                              .tax
                                              .toString(),
                                          qquantityy: order_history_list[index]
                                              .orderQuantity
                                              .toString(),
                                          ccus_namee: order_history_list[index]
                                              .customerName
                                              .toString(),
                                          ccus_address:
                                              order_history_list[index]
                                                  .customerAddress
                                                  .toString(),
                                          ddelivert_char:
                                              order_history_list[index]
                                                  .deliveryCharges
                                                  .toString(),
                                          oorder_statuss:
                                              order_history_list[index]
                                                  .orderStatus
                                                  .toString());
                                    }),
                              );
                            }
                          }),
                    )

                    // Container(
                    //   child: Column(children: [
                    //     order_history_tile(context, "fa", "fa"),
                    //     order_history_tile(context, "fa", "fa"),
                    //     order_history_tile(context, "fa", "fa"),
                    //     order_history_tile(context, "fa", "fa"),
                    //     order_history_tile(context, "fa", "fa"),
                    //     order_history_tile(context, "fa", "fa"),
                    //   ]),
                    // ),

                    //Completed

                    ,
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: order_history_active_list.length,
                                itemBuilder: (context, index) {
                                  return Order_history_tile_class(
                                      Cat_nam: "BBQ",
                                      prod_nam: order_history_active_list[index]
                                          .productName
                                          .toString(),
                                      ppricee: order_history_active_list[index]
                                          .totalAmount
                                          .toString(),
                                      ddatee: order_history_active_list[index]
                                          .date
                                          .toString(),
                                      iidd: order_history_active_list[index]
                                          .orderId
                                          .toString(),
                                      iimagee: order_history_active_list[index]
                                          .productImage1
                                          .toString(),
                                      nnew_pricee:
                                          order_history_active_list[index]
                                              .newPrice
                                              .toString(),
                                      nnet_amountt:
                                          order_history_active_list[index]
                                              .netAmount
                                              .toString(),
                                      ttaxx: order_history_active_list[index]
                                          .tax
                                          .toString(),
                                      qquantityy:
                                          order_history_active_list[index]
                                              .orderQuantity
                                              .toString(),
                                      ccus_namee:
                                          order_history_active_list[index]
                                              .customerName
                                              .toString(),
                                      ccus_address:
                                          order_history_active_list[index]
                                              .customerAddress
                                              .toString(),
                                      ddelivert_char:
                                          order_history_active_list[index]
                                              .deliveryCharges
                                              .toString(),
                                      oorder_statuss:
                                          order_history_active_list[index]
                                              .orderStatus
                                              .toString());
                                }),
                          )
                          // order_history_tile(context),
                          // order_history_tile(context),
                        ],
                      ),
                    ),

                    //Failed

                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: order_history_failed_list.length,
                                itemBuilder: (context, index) {
                                  return Order_history_tile_class(
                                      Cat_nam: "BBQ",
                                      prod_nam: order_history_failed_list[index]
                                          .productName
                                          .toString(),
                                      ppricee: order_history_failed_list[index]
                                          .totalAmount
                                          .toString(),
                                      ddatee: order_history_failed_list[index]
                                          .date
                                          .toString(),
                                      iidd: order_history_failed_list[index]
                                          .orderId
                                          .toString(),
                                      iimagee: order_history_failed_list[index]
                                          .productImage1
                                          .toString(),
                                      nnew_pricee:
                                          order_history_failed_list[index]
                                              .newPrice
                                              .toString(),
                                      nnet_amountt:
                                          order_history_failed_list[index]
                                              .netAmount
                                              .toString(),
                                      ttaxx: order_history_failed_list[index]
                                          .tax
                                          .toString(),
                                      qquantityy:
                                          order_history_failed_list[index]
                                              .orderQuantity
                                              .toString(),
                                      ccus_namee:
                                          order_history_failed_list[index]
                                              .customerName
                                              .toString(),
                                      ccus_address:
                                          order_history_failed_list[index]
                                              .customerAddress
                                              .toString(),
                                      ddelivert_char:
                                          order_history_failed_list[index]
                                              .deliveryCharges
                                              .toString(),
                                      oorder_statuss:
                                          order_history_failed_list[index]
                                              .orderStatus
                                              .toString());
                                }),
                          )
                          // order_history_tile(context),
                          // order_history_tile(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: TabBarViewData(),
    );
  }
}
