import 'dart:convert';
import 'package:schmersal_poc/models/client.dart';

List<Client> parseClients(String responseBody) { 
   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
   return parsed.map<Client>((json) =>Client.fromMap(json)).toList(); 
} 