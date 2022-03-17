import 'package:carousel_slider/carousel_slider.dart';
import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/views/pages/addCart/addtoCart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

enum BestBeverages { Coke, Pepsi, Gormet }

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _current = 0;
  var _productCounter = 0;
  void _incrementProductCounter() {
    setState(() {
      _productCounter++;
    });
  }

  void _decrementProductCounter() {
    setState(() {
      _productCounter--;
    });
  }

  final CarouselController _controller = CarouselController();
  BestBeverages? _site = BestBeverages.Coke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
          Text(
            "Product Name",
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 1)),
            ),
            textAlign: TextAlign.center,
          ),

          // scroll able column
          Container(
            height: displayHeight(context) / 1.99,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$75.0",
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(237, 41, 57, 1)),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 7.5,
                        ),
                        Text(
                          "\$150.0",
                          style: new TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: Container(
                      margin:
                          EdgeInsets.only(top: displayHeight(context) * 0.05),
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
                            "25min delivery",
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
                    margin: EdgeInsets.only(
                      top: 10.0,
                      left: displayWidth(context) / 2 * 0.17,
                      right: displayWidth(context) / 2 * 0.17,
                    ),
                    child: Divider(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      thickness: 0.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: ListTile(
                      title: Text(
                        '+Coke',
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1))),
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
                        ".0",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      // top: 10.0,
                      left: displayWidth(context) / 2 * 0.17,
                      right: displayWidth(context) / 2 * 0.17,
                    ),
                    child: Divider(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      thickness: 0.5,
                    ),
                  ),
                  Container(
                      width: displayWidth(context),
                      margin: EdgeInsets.only(left: 32.0, top: 10.0),
                      child: Text(
                        "Special Instructions",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 10.0),
                    width: displayWidth(context),
                    height: displayHeight(context) / 4 * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                              24.0) //         <--- border radius here
                          ),
                      border: Border.all(
                          width: 1,
                          // color: Colors.white,
                          color: Color.fromRGBO(0, 0, 0, 0.2)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "eg. no mayo |",
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(0, 0, 0, 0.5))),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _productCounter == 0
                            ? null
                            : _decrementProductCounter,
                        child: Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(
                            left: 32.0,
                            top: 10.0,
                          ),
                          height: displayHeight(context) / 4 * 0.35,
                          width: displayWidth(context) / 8,
                          decoration: Constants.productpagebuttonstyle(),
                          child: Text(
                            "-",
                            style: TextStyle(color: Colors.white, fontSize: 55),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0),
                        child: Text(
                          "$_productCounter",
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.5))),
                        ),
                      ),
                      GestureDetector(
                        onTap: _incrementProductCounter,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            // left: 32.0,
                            top: 10.0,
                          ),
                          height: displayHeight(context) / 4 * 0.35,
                          width: displayWidth(context) / 8,
                          decoration: Constants.productpagebuttonstyle(),
                          child: Text(
                            "+",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddToCart()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            left: 10.0,
                            top: 10.0,
                          ),
                          height: displayHeight(context) / 4 * 0.35,
                          width: displayWidth(context) / 2.3,
                          decoration: Constants.productpagebuttonstyle(),
                          child: Text(
                            "Add to Cart",
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                            // textAlign: TextAlign.center,
                          ),
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
    );
  }
}
