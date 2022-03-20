import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/views/pages/Rider/rider_order/api_call_func.dart';
import 'package:customerapp/views/pages/Rider/rider_order/rr_orderHistory.dart';
import 'package:customerapp/views/pages/Rider/rider_order/order_tile.dart';
import 'package:customerapp/views/widgets/r_tabButton.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class RROrderPage extends StatefulWidget {
  const RROrderPage({Key? key}) : super(key: key);

  @override
  _RROrderPageState createState() => _RROrderPageState();
}

class _RROrderPageState extends State<RROrderPage>
    with TickerProviderStateMixin {
  final RROrdersHistory OH = RROrdersHistory();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectPage = 0;
  PageController? _pageControle;

  void _changePage(int pageNumber) {
    setState(() {
      _selectPage = pageNumber;
      _pageControle?.animateToPage(
        pageNumber,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageControle = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageControle?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: Drawer(
      //   child: Drawer_widget(context),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        // height: 1300,
        // height: displayHeight(context) - kBottomNavigationBarHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Image.asset("assets/images/Menu.png"),
                      // icon: Icon(Icons.menu, color: Color(0xFF1f186f),),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      }),
                  SizedBox(
                    width: displayWidth(context) * 0.25,
                  ),
                  Text(
                    "Orders",
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
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RTabButton(
                    text: "Orders",
                    pageNumber: 0,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(0);
                    },
                  ),
                  RTabButton(
                    text: "Scheduled",
                    pageNumber: 1,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(1);
                    },
                  ),
                  RTabButton(
                    text: "History",
                    pageNumber: 2,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(2);
                    },
                  ),
                ],
              ),
            ),
            //search bar
            Container(
              margin: EdgeInsets.only(top: 25, left: 25),
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
            Flexible(
              // height: 1000,
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    _selectPage = page;
                  });
                },
                controller: _pageControle,
                children: [
                  //-----------------------------------Orders Page-------------------------------//
                  Container(
                    // width: MediaQuery.of(context).size.width * 0.9,
                    // color: Colors.amber,
                    margin: EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FutureBuilder(
                            future: get_order_history_api(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 180,
                                    ),
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Container(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      // physics:
                                      //     NeverScrollableScrollPhysics(),
                                      itemCount: order_active_main_list.length,
                                      itemBuilder: (context, index) {
                                        return order_tile_class(
                                            iid: order_active_main_list[index]
                                                .orderId
                                                .toString(),
                                            pprice:
                                                order_active_main_list[index]
                                                    .totalAmount
                                                    .toString(),
                                            ssubname:
                                                order_active_main_list[index]
                                                    .productName
                                                    .toString(),
                                            aadress:
                                                order_active_main_list[index]
                                                    .customerAddress
                                                    .toString(),
                                            qquantity:
                                                order_active_main_list[index]
                                                    .orderQuantity
                                                    .toString(),
                                            ddate: order_active_main_list[index]
                                                .date
                                                .toString(),
                                            oorder_status:
                                                order_active_main_list[index]
                                                    .orderStatus
                                                    .toString());
                                      }),
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                  //-----------------------------------Scheduled Page-------------------------------//
                  Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FutureBuilder(
                            future: get_order_history_api(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 180,
                                    ),
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Container(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      // physics: NeverScrollableScrollPhysics(),
                                      itemCount: order_scheduled_list.length,
                                      itemBuilder: (context, index) {
                                        return order_tile_class(
                                            iid: order_scheduled_list[index]
                                                .orderId
                                                .toString(),
                                            pprice: order_scheduled_list[index]
                                                .totalAmount
                                                .toString(),
                                            ssubname:
                                                order_scheduled_list[index]
                                                    .productName
                                                    .toString(),
                                            aadress: order_scheduled_list[index]
                                                .customerAddress
                                                .toString(),
                                            qquantity:
                                                order_scheduled_list[index]
                                                    .orderQuantity
                                                    .toString(),
                                            ddate: order_scheduled_list[index]
                                                .date
                                                .toString(),
                                            oorder_status:
                                                order_scheduled_list[index]
                                                    .orderStatus
                                                    .toString());
                                      }),
                                );
                              }
                            }),
                      ],
                    ),
                  ),
                  //History

                  Container(
                    child: RROrdersHistory(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      // bottomNavigationBar: TabBarViewData(),
    );
  }
}

//order tile bhi bna hoa same he
