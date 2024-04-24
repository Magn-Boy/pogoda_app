import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final _client = http.Client();

  Future<String?> auth(
      {required String username, required String password}) async {
    final url = Uri.parse('http://192.168.100.63:8080/auth');
    final response = await _client.post(
      url,
      body: json.encode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    return response.statusCode == 200
        ? json.decode(response.body)['token']
        : null;
  }
}
