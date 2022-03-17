import 'package:customerapp/views/pages/Rider/r_HomeScreen/r_orders.dart';
import 'package:customerapp/views/pages/Rider/r_accountSetting/r_accountSetting.dart';
import 'package:customerapp/views/pages/Rider/r_earning/r_earning.dart';
import 'package:customerapp/views/pages/chatScreens/chat_main_screen.dart';
import 'package:flutter/material.dart';

class Rider_calling_screen extends StatefulWidget {
  const Rider_calling_screen({Key? key}) : super(key: key);

  @override
  State<Rider_calling_screen> createState() => _Rider_calling_screenState();
}

class _Rider_calling_screenState extends State<Rider_calling_screen> {
  int currentIndex = 1;
  final screens = [
    REarning(),
    ROrderPage(),
    ChatMainScreen(),
    RAccountSetting()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: screens[currentIndex],
        ),

        //bottom bar

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.deepOrangeAccent,
              //unselectedItemColor: Colors.grey,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/r_assets/images/Wallet.png"),
                    //color: Colors.black,
                    size: 35,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                        "assets/r_assets/images/foodimages/timeicon.png"),
                    size: 35,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/r_assets/images/Chat.png"),
                      size: 28,
                    ),
                    label: ""
                    // icon: ImageIcon(
                    //   AssetImage("assets/images/Category.png"),
                    //   //color: Colors.black,
                    // ),
                    // label: '',
                    ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/r_assets/images/Setting.png"),
                    size: 35,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ));
  }
}
