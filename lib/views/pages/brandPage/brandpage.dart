import 'package:carousel_slider/carousel_slider.dart';
import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/views/pages/customerpages/brandprofilepage.dart';
import 'package:customerapp/views/pages/productPage/productpage.dart';
import 'package:customerapp/views/widgets/tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<String> imgList = [
  'assets/images/foodimages/slider_image1.png',
  'assets/images/foodimages/slider_image1.png',
  'assets/images/foodimages/slider_image1.png',
  'assets/images/foodimages/slider_image1.png',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                    ),
                    // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    // Positioned(
                    //   bottom: 0.0,
                    //   left: 0.0,
                    //   right: 0.0,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Color.fromARGB(200, 0, 0, 0),
                    //           Color.fromARGB(0, 0, 0, 0)
                    //         ],
                    //         begin: Alignment.bottomCenter,
                    //         end: Alignment.topCenter,
                    //       ),
                    //     ),
                    //     padding: EdgeInsets.symmetric(
                    //         vertical: 10.0, horizontal: 20.0),
                    //     child: Text(
                    //       'No. ${imgList.indexOf(item)} image',
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                )),
          ),
        ))
    .toList();

class BrandPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BrandPageState();
  }
}

class _BrandPageState extends State<BrandPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, bottom: 8.0, left: 32.0, right: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset("assets/images/chevron_left.png")),
                Container(
                    height: 44.0,
                    width: 44.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(237, 31, 57, 0.1),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Image.asset("assets/images/share_icon.png")),
              ],
            ),
          ),
          CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.red)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    // builder: (context) => BrandPage()
                    builder: (context) => RestaurantProfilePage()),
              );
            },
            child: Text(
              "Brand Name",
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "\$150.0",
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(237, 41, 57, 1)),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            child: Container(
              margin: EdgeInsets.only(top: displayHeight(context) * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery info",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ),
                  Text(
                    "25min",
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(237, 41, 57, 1))),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 32.0, top: 8.0, right: 32.0),
            // width: displayWidth(context) * 0.7,
            child: Text(
              "Delivered between monday aug and thursday 20 from 8pm to 9:30 pm",
              style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(0, 0, 0, 0.5))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 32.0, bottom: 10.0, top: 20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              "Recently",
              style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 1))),
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
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
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
                          padding: EdgeInsets.only(left: 8.0, top: 9.0),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                          child: Text(
                            "9916 Strawberry Street Montclair, NJ 07042",
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
                          padding: EdgeInsets.only(left: 8.0, top: 10),
                          child: Text(
                            "\$30",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
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
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
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
                          padding: EdgeInsets.only(left: 8.0, top: 9.0),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                          child: Text(
                            "9916 Strawberry Street Montclair, NJ 07042",
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
                          padding: EdgeInsets.only(left: 8.0, top: 10),
                          child: Text(
                            "\$30",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
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
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
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
                          padding: EdgeInsets.only(left: 8.0, top: 9.0),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                          child: Text(
                            "9916 Strawberry Street Montclair, NJ 07042",
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
                          padding: EdgeInsets.only(left: 8.0, top: 10),
                          child: Text(
                            "\$30",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
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
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
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
                          padding: EdgeInsets.only(left: 8.0, top: 9.0),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                          child: Text(
                            "9916 Strawberry Street Montclair, NJ 07042",
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
                          padding: EdgeInsets.only(left: 8.0, top: 10),
                          child: Text(
                            "\$30",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
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
          Container(
            height: displayHeight(context) * 0.066,
            width: displayWidth(context) / 1.17,
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Container(
                    child: Text(
                      "Category 1",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 2.0, color: Colors.red.shade900),
                      ),
                    ),
                    // width: 160.0,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Container(
                    child: Text(
                      "Category 2",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(176, 176, 178, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(
                        //       width: 2.0, color: Colors.red.shade900
                        //   ),
                        // ),
                        ),
                    // width: 160.0,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Container(
                    child: Text(
                      "Category 3",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(176, 176, 178, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(
                        //       width: 2.0, color: Colors.red.shade900
                        //   ),
                        // ),
                        ),
                    // width: 160.0,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Container(
                    child: Text(
                      "Category 4",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(176, 176, 178, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(
                        //       width: 2.0, color: Colors.red.shade900
                        //   ),
                        // ),
                        ),
                    // width: 160.0,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Container(
                    child: Text(
                      "Category 5",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(176, 176, 178, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(
                        //       width: 2.0, color: Colors.red.shade900
                        //   ),
                        // ),
                        ),
                    // width: 160.0,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Container(
                    child: Text(
                      "Category 6",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          color: Color.fromRGBO(176, 176, 178, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(
                        //       width: 2.0, color: Colors.red.shade900
                        //   ),
                        // ),
                        ),
                    // width: 160.0,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(
              left: 32.0,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              "Near You",
              style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 1),
              )),
            ),
          ),
          // list data
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductPage()),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 25),
              height: displayHeight(context) * 0.24018,
              width: displayWidth(context) / 1.17,
              decoration: Constants.favoriteContainerstyle(),
              child: Row(
                children: [
                  Column(
                    children: [
                      Image.asset("assets/images/foodimages/product.png"),
                    ],
                  ),
                  SizedBox(
                    width: displayWidth(context) * 0.035,
                  ),
                  SizedBox(
                    width: displayWidth(context) * 0.48,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Product Name",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  )),
                                ),
                                Image.asset(
                                    "assets/images/foodimages/Heart.png")
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 9.0),
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
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0, top: 10),
                            child: Text(
                              "9916 Strawberry Street Montclair, NJ 07042",
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
                              top: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$30 Delivery fee",
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0,
                                  width: 31.0,
                                  child: Image.asset(
                                      "assets/images/foodimages/halal_logo.png"),
                                )
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
          ),
        ]),
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
