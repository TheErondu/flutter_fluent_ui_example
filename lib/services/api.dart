import 'dart:convert';
import 'package:hermes/services/auth.dart';
import 'package:hermes/utils/tools.dart';
import 'package:http/http.dart' as http;

var apiUrl = "http://127.0.0.1:8000/api";

Future<dynamic> getPublicIP() async {
  var url = Uri.parse('https://api64.ipify.org/');

  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var ip = response.body;
      return ip;
    } else {
      return 'Unknown';
    }
  } catch (e) {
    return "error getting IP Address";
  }
}

Future<void> loginCall(String email, String password) async {
  final response = await http.post(
    Uri.parse('$apiUrl/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 authenticated response,
    // then parse the JSON.
    Auth().setCredentials(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

Future<List> getModule(query) async {
  final token = await getFromStorage('userdata', 'access_token');
  final response = await http.get(
    Uri.parse('$apiUrl/$query'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 authenticated response,
    // then parse the JSON.
    //  toLog(response.body);
    List data = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    return data;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    var data = (response.statusCode);
    throw Exception('Failed to get List of Items, Error:$data');
  }
}
