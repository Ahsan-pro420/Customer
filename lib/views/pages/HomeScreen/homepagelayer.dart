import 'package:customerapp/views/pages/brandPage/brandpage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:customerapp/views/pages/HomeScreen/secondlayer.dart';
import 'package:customerapp/views/widgets/progress_status_bar_widget.dart';
import 'package:customerapp/views/widgets/tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageLayer extends StatefulWidget {
  const HomePageLayer({Key? key}) : super(key: key);

  @override
  _HomePageLayerState createState() => _HomePageLayerState();
}

class _HomePageLayerState extends State<HomePageLayer>
    with TickerProviderStateMixin {
  String? userapitoken;
  _getuserapitoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userapitoken = pref.getString("user_api_token");
    print(pref.getString("user_type"));
    print(userapitoken!);
  }

  @override
  void initState() {
    super.initState();
    _getuserapitoken();
  }

  double xoffSet = 0;
  double yoffSet = 0;
  double minuYSet = 0;
  double angle = 0;
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4Transform()
          .translate(x: xoffSet, y: yoffSet)
          .rotate(angle)
          .matrix4,
      duration: Duration(milliseconds: 250),
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // color: Colors.blue[200],
              color: Colors.grey[200]),
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        !isOpen
                            ? IconButton(
                                icon: Image.asset("assets/images/Menu.png"),
                                // icon: Icon(Icons.menu, color: Color(0xFF1f186f),),
                                onPressed: () {
                                  setState(() {
                                    xoffSet = 220;
                                    yoffSet = 110;
                                    angle = 0;
                                    // angle = -0.2;
                                    isOpen = true;
                                  });
                                  secondLayerState!.setState(() {
                                    secondLayerState!.xoffSet = 195;
                                    secondLayerState!.yoffSet = 150;
                                    secondLayerState!.angle = 0;
                                    // secondLayerState!.angle = -0.275;
                                  });
                                })
                            : IconButton(
                                icon: Image.asset("assets/images/Menu.png"),
                                // icon: Icon(Icons.arrow_back_ios, color: Color(0xFF1f186f)),
                                onPressed: () {
                                  setState(() {
                                    xoffSet = 0;
                                    yoffSet = 0;
                                    angle = 0;
                                    isOpen = false;
                                  });
                                  secondLayerState!.setState(() {
                                    secondLayerState!.xoffSet = 0;
                                    secondLayerState!.yoffSet = 0;
                                    secondLayerState!.angle = 0;
                                  });
                                }),
                        // bottom navigation bar
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      width: displayWidth(context) / 1.1,
                      child: Text(
                        "What do \nyou want to eat?",
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.w700),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 25),
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
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 25),
                      height: displayHeight(context) * 0.035,
                      width: displayWidth(context) / 1.17,
                      child: BalloonSliderDemo(),
                    ),
                    Container(
                      height: displayHeight(context) * 0.066,
                      width: displayWidth(context) / 1.17,
                      margin:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8.0),
                            child: Container(
                              child: Text(
                                "Popular",
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
                                  bottom: BorderSide(
                                      width: 2.0, color: Colors.red.shade900),
                                ),
                              ),
                              // width: 160.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8.0),
                            child: Container(
                              child: Text(
                                "Restaurant",
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
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8.0),
                            child: Container(
                              child: Text(
                                "HBB",
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
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8.0),
                            child: Container(
                              child: Text(
                                "Food Stalls",
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
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8.0),
                            child: Container(
                              child: Text(
                                "Brands",
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
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 8.0),
                            child: Container(
                              child: Text(
                                "Home Made",
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
                      margin: EdgeInsets.only(right: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "see more",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(237, 41, 57, 1),
                              ),
                            ),
                          ),
                          Image.asset("assets/images/arrow_right.png"),
                        ],
                      ),
                    ),
                    Container(
                      height: displayHeight(context) * 0.31,
                      width: displayWidth(context) / 1.17,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
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
                                  Image.asset(
                                      "assets/images/foodimages/food1.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 9.0),
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
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 10),
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
                              // Navigator.pop(context);
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
                                  Image.asset(
                                      "assets/images/foodimages/food1.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 9.0),
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
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 10),
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
                                  Image.asset(
                                      "assets/images/foodimages/food1.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 9.0),
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
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 10),
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
                                  Image.asset(
                                      "assets/images/foodimages/food1.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 9.0),
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
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 10),
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
                      margin: EdgeInsets.only(left: 30.0),
                      height: displayHeight(context) * 0.046,
                      width: displayWidth(context) / 1.17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: displayWidth(context) / 3.1,
                          ),
                          Text(
                            "see more",
                            style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Color.fromRGBO(237, 41, 57, 1),
                            ),
                          ),
                          Image.asset("assets/images/arrow_right.png"),
                        ],
                      ),
                    ),
                    Container(
                      height: displayHeight(context) * 0.31,
                      width: displayWidth(context) / 1.17,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
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
                                  Image.asset(
                                      "assets/images/foodimages/food1.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 9.0),
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
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 10),
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
                                  Image.asset(
                                      "assets/images/foodimages/food1.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 9.0),
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
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 10),
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
                                  Image.asset(
                                      "assets/images/foodimages/food1.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 9.0),
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
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 10),
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
                                  Image.asset(
                                      "assets/images/foodimages/food1.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 9.0),
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
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 8.0, top: 10),
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
                                    padding:
                                        EdgeInsets.only(left: 8.0, top: 10),
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
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
