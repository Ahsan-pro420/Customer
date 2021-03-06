import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  // b
  // static const _initialCameraPosition =
  //     CameraPosition(target: LatLng(33.773972, -122.431297), zoom: 11.5);
  // late GoogleMapController _googleMapController;

  // @override
  // void dispose() {
  //   _googleMapController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: displayHeight(context)*0.3,
                // width: displayWidth(context),
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //     begin: Alignment.topLeft,
                    //
                    //     end: Alignment.bottomRight,
                    //   colors: [
                    //     Color.fromRGBO(0, 0, 0, 0),
                    //     Color.fromRGBO(0, 0, 0, 0.48),
                    //     Color.fromRGBO(0, 0, 0, 1)
                    //   ],
                    //   stops: [
                    //     0.0,
                    //     0.64,
                    //     1.0,
                    //   ]
                    //   // colors: _colors,
                    //   // stops: _stops,
                    // )
                    ),
                child: Stack(
                  children: [
                    Image.asset("assets/images/foodimages/order_image.png"),
                    Image.asset("assets/images/foodimages/gradient_image.png"),
                    Positioned(
                      top: displayHeight(context) * 0.064,
                      left: displayWidth(context) * 0.066,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                              "assets/images/foodimages/left_arrow.png")),
                    ),
                    Positioned(
                      top: displayHeight(context) * 0.061,
                      left: displayWidth(context) / 3,
                      child: Text(
                        "Order Details",
                        style: GoogleFonts.ubuntu(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: displayHeight(context) * 0.049,
                      right: displayWidth(context) * 0.066,
                      child: Image.asset(
                          "assets/images/foodimages/halal_logo.png"),
                    ),
                    Positioned(
                      top: displayHeight(context) * 0.232,
                      left: displayWidth(context) * 0.040,
                      // bottom: displayHeight(context)*0.049,
                      child: Text(
                        "KFC - PAYA LEBAR",
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // b
              // Container(
              //   height: displayHeight(context) * 0.35,
              //   width: displayWidth(context) / 1.17,
              //   decoration: Constants.containerstyle(),
              //   child: GoogleMap(
              //     initialCameraPosition: _initialCameraPosition,
              //     zoomControlsEnabled: false,
              //   ),
              // ),
              Container(
                height: displayHeight(context) * 0.35,
                width: displayWidth(context) / 1.17,
                decoration: Constants.containerstyle(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Number",
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: Text(
                          "1351265",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color.fromRGBO(237, 41, 57, 1),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 22.0),
                        child: Divider(
                          color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                          height: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          "From",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 16.0, right: 25.0),
                        child: Text(
                          "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singaore 409057",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 22.0),
                        child: Divider(
                          color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                          height: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          "Delivery Address",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 16.0, right: 25.0),
                        child: Text(
                          "10 Paya Lebar Rd, #B1-14 PLQ Mall, Singaore 409057",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 22.0),
                        child: Divider(
                          color: Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                          height: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                              textStyle: Constants.blackboldlightstyle(),
                            ),
                          ),
                          Text(
                            "\$95.00",
                            style: GoogleFonts.ubuntu(
                              textStyle: Constants.blackboldlightstyle(),
                            ),
                          ),
                        ],
                      ),
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
