import 'package:customerapp/views/pages/Favorite/favorite.dart';
import 'package:customerapp/views/pages/customerpages/customerwallet.dart';
// import 'package:customerapp/views/pages/brandPage/brandpage.dart';
// import 'package:customerapp/views/pages/checkoutPage/checkoutpage.dart';
// import 'package:customerapp/views/pages/failurePage/failurepage.dart';
import 'package:customerapp/views/pages/myOrder/myorder.dart';
// import 'package:customerapp/views/pages/brandPage/brandpage.dart';
// import 'package:customerapp/views/pages/productPage/productpage.dart';
// import 'package:customerapp/views/pages/successPage/successpage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customerapp/utills/Displaywidth.dart';
// import 'package:customerapp/views/pages/OrderHistory/orderHistory.dart';
import 'package:customerapp/views/pages/accountSetting/accountSetting.dart';

class ThirdLayer extends StatefulWidget {
  const ThirdLayer({Key? key}) : super(key: key);

  @override
  _ThirdLayerState createState() => _ThirdLayerState();
}

class _ThirdLayerState extends State<ThirdLayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.8,
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  builder: (context) => CustomerWallet()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                  image:
                                      AssetImage("assets/images/Wallet.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Wallet",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                              SizedBox(
                                width: 20,
                              ),
                              Text("\$87.00",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.red,
                                  ))),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: displayWidth(context) / 2 * 0.2),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        // 2nd
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => OrderHistory()),
                        //     );
                        //   },
                        //   child: Row(
                        //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Image(image: AssetImage("assets/images/Bag.png")),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text("Order History",
                        //           style: GoogleFonts.ubuntu(
                        //               textStyle: TextStyle(
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: 17,
                        //             color: Colors.black,
                        //           ))),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       left: displayWidth(context) / 2 * 0.2),
                        //   child: Divider(
                        //     color: Colors.grey[100],
                        //     thickness: 2,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 20),
                        // ),

                        // 3rd

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountSetting()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                  image:
                                      AssetImage("assets/images/Setting.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Account Settings",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: displayWidth(context) / 2 * 0.2),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),

                        //4th
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                                image: AssetImage(
                                    "assets/images/DangerCircle.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Need Help",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.black,
                                ))),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: displayWidth(context) / 2 * 0.2),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),

                        //5th

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(image: AssetImage("assets/images/Paper.png")),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Term & Conditions",
                                style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.black,
                                ))),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: displayWidth(context) / 2 * 0.2),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),

                        // 6th
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyOrders()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/images/Bag.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("My Orders",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: displayWidth(context) / 2 * 0.2),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        // 7th
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyFavorite()),
                            );
                          },
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/images/Bag.png")),
                              SizedBox(
                                width: 10,
                              ),
                              Text("My Favorite",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ))),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: displayWidth(context) / 2 * 0.2),
                          child: Divider(
                            color: Colors.grey[100],
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),

                        // // 8th
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           // builder: (context) => BrandPage()
                        //           builder: (context) => BrandPage()),
                        //     );
                        //   },
                        //   child: Row(
                        //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Image(image: AssetImage("assets/images/Bag.png")),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text("Brand Page",
                        //           style: GoogleFonts.ubuntu(
                        //               textStyle: TextStyle(
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: 17,
                        //             color: Colors.black,
                        //           ))),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       left: displayWidth(context) / 2 * 0.2),
                        //   child: Divider(
                        //     color: Colors.grey[100],
                        //     thickness: 2,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 20),
                        // ),

                        // // 9th
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           // builder: (context) => BrandPage()
                        //           builder: (context) => ProductPage()),
                        //     );
                        //   },
                        //   child: Row(
                        //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Image(image: AssetImage("assets/images/Bag.png")),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text("Product Page",
                        //           style: GoogleFonts.ubuntu(
                        //               textStyle: TextStyle(
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: 17,
                        //             color: Colors.black,
                        //           ))),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       left: displayWidth(context) / 2 * 0.2),
                        //   child: Divider(
                        //     color: Colors.grey[100],
                        //     thickness: 2,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 20),
                        // ),

                        // // 10th
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           // builder: (context) => BrandPage()
                        //           builder: (context) => CheckoutPage()),
                        //     );
                        //   },
                        //   child: Row(
                        //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Image(image: AssetImage("assets/images/Bag.png")),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text("Checkout Page",
                        //           style: GoogleFonts.ubuntu(
                        //               textStyle: TextStyle(
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: 17,
                        //             color: Colors.black,
                        //           ))),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       left: displayWidth(context) / 2 * 0.2),
                        //   child: Divider(
                        //     color: Colors.grey[100],
                        //     thickness: 2,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 20),
                        // ),
                        // // 11th
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           // builder: (context) => BrandPage()
                        //           builder: (context) => SuccessPage()),
                        //     );
                        //   },
                        //   child: Row(
                        //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Image(image: AssetImage("assets/images/Bag.png")),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text("Success Page",
                        //           style: GoogleFonts.ubuntu(
                        //               textStyle: TextStyle(
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: 17,
                        //             color: Colors.black,
                        //           ))),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       left: displayWidth(context) / 2 * 0.2),
                        //   child: Divider(
                        //     color: Colors.grey[100],
                        //     thickness: 2,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 20),
                        // ),
                        // // 12th
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           // builder: (context) => BrandPage()
                        //           builder: (context) => FailurePage()),
                        //     );
                        //   },
                        //   child: Row(
                        //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Image(image: AssetImage("assets/images/Bag.png")),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //       Text("Failure Page",
                        //           style: GoogleFonts.ubuntu(
                        //               textStyle: TextStyle(
                        //             fontWeight: FontWeight.w500,
                        //             fontSize: 17,
                        //             color: Colors.black,
                        //           ))),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       left: displayWidth(context) / 2 * 0.2),
                        //   child: Divider(
                        //     color: Colors.grey[100],
                        //     thickness: 2,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 20),
                        // ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
