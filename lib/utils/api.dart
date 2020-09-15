import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schmersal_poc/enums/device_types.dart';
import 'package:schmersal_poc/models/client.dart';
import 'package:schmersal_poc/utils/parser.dart';

Future<List<Client>> fetchClients() async {
  //  final response = await http.get('http://localhost:8000/clients.json');
  //  if (response.statusCode == 200) {
  //     return parseClients(response.body);
  //  } else {
  //     throw Exception('Unable to fetch products from the REST API');
  //  }
  var clients = JsonEncoder().convert(config.clients);
  return parseClients(clients);
}
