import 'package:customerapp/Theme/Theme.dart';
import 'package:customerapp/utills/Displaywidth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget RR_Earning_widget1(context, date, iidd, timee, amountt) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: 20, top: 20, bottom: 10),
        alignment: Alignment.centerLeft,
        child: Text(
          date,
          style: Constants.blacknormalstyle(),
        ),
      ),
      Container(
          margin: EdgeInsets.only(bottom: 8),
          child: RR_Earning_widget2(context, iidd, timee, amountt))
    ],
  );
}

Widget RR_Earning_widget2(context, idd, time, amount) {
  return Container(
    height: displayHeight(context) * 0.09,
    width: displayWidth(context) / 1.1,
    decoration: Constants.containerstyle(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 14.0,
            left: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order ID",
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1))),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  time,
                  style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(121, 118, 125, 1))),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, right: 30.0),
          child: Text(
            idd,
            style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Text(
            amount,
            style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(94, 207, 99, 1))),
          ),
        ),
      ],
    ),
  );
}

Widget Earning_Widget(context, Monthly_p, Weekly_p, Today_p) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    decoration: Constants.containerstyle(),
    height: displayHeight(context) * 0.12,
    width: displayWidth(context) / 1.1,
    child: Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Monthly",
                style: Constants.earningtextstyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                Monthly_p,
                style: Constants.earningstyle(),
              ),
            ],
          ),
          SizedBox(
            width: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Weekly",
                style: Constants.earningtextstyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                Weekly_p,
                style: Constants.earningstyle(),
              ),
            ],
          ),
          SizedBox(
            width: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today",
                style: Constants.earningtextstyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$Today_p",
                style: Constants.earningstyle(),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
