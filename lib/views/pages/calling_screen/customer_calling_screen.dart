import 'package:customerapp/views/pages/Favorite/favorite.dart';
import 'package:customerapp/views/pages/HomeScreen/HomeScreen.dart';
import 'package:customerapp/views/pages/OrderHistory/orderHistory.dart';
import 'package:customerapp/views/pages/accountSetting/accountSetting.dart';
import 'package:customerapp/views/pages/customerpages/customerwallet.dart';
import 'package:customerapp/views/pages/myOrder/myorder.dart';
import 'package:flutter/material.dart';

class Customer_Calling_Screen extends StatefulWidget {
  const Customer_Calling_Screen({Key? key}) : super(key: key);

  @override
  State<Customer_Calling_Screen> createState() =>
      _Customer_Calling_ScreenState();
}

class _Customer_Calling_ScreenState extends State<Customer_Calling_Screen> {
  int currentIndex = 1;
  final screens = [
    HomeScreen(),
    MyOrders(),
    CustomerWallet(),
    MyFavorite(),
    AccountSetting()
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
                    AssetImage("assets/images/Home.png"),
                    //color: Colors.black,
                    size: 35,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/nav2.png"),
                    size: 35,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/images/Wallet.png"),
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
                    AssetImage("assets/images/Heart.png"),
                    size: 35,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/Setting.png"),
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
