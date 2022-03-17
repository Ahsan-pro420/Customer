import 'package:customerapp/views/pages/HomeScreen/HomeScreen.dart';
import 'package:customerapp/views/pages/Rider/calling_screen/rider_calling_screen.dart';
import 'package:customerapp/views/pages/Rider/r_HomeScreen/r_orders.dart';

import 'package:customerapp/views/pages/calling_screen/customer_calling_screen.dart';
import 'package:flutter/material.dart';

class Cus_or_Rider extends StatelessWidget {
  const Cus_or_Rider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
              height: 50,
              width: 180,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Customer_Calling_Screen()));
                  },
                  child: Text("Customer")),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black,
              height: 50,
              width: 180,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Rider_calling_screen()));
                  },
                  child: Text("Rider")),
            )
          ],
        ),
      ),
    );
  }
}
