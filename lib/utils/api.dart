import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:schmersal_poc/models/client.dart';
import 'package:schmersal_poc/models/login.dart';
import 'package:schmersal_poc/utils/parser.dart';

Future<List<Client>> fetchClients() async {
  // final response =
      // await http.get('http://13.71.32.132:9000/api/CustomerListing');
  final response = await http.get('http://40.81.229.103/api/CustomerListing');
  if (response.statusCode == 200) {
    return parseClients(response.body);
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
  // var clients = JsonEncoder().convert(config.clients);
  // return parseClients(clients);
}

Future<Login> loginAPI(String url, BuildContext context) async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
    Map<String, dynamic> data = json.decode(response.body);
    if(data["isAuthenticated"]) {
      Navigator.pushNamed(context, '/home');
    }
    return   Login.fromJson(json.decode(response.body));
  } else {
    throw Exception('Unable to fetch User');
  }
  // var clients = JsonEncoder().convert(config.clients);
  // return parseClients(clients);
}
