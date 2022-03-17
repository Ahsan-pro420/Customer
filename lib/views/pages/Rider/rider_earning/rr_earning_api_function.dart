import 'dart:convert';

import 'package:customerapp/Model/sales_api_model/sales_api_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

List<SalesApiModel> Sales_Api_Data_List = [];

Future<List<SalesApiModel>> get_sales_data_api() async {
  final response = await http.get(Uri.parse(
      "https://persecuted-admissio.000webhostapp.com/restaurant/restaurant_api/sale.php"));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    Sales_Api_Data_List.clear();

    for (Map i in data) {
      Sales_Api_Data_List.add(SalesApiModel.fromJson(i));
    }

    return Sales_Api_Data_List;
  } else {
    return Sales_Api_Data_List;
  }
}
