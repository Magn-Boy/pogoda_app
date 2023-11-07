import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pogoda_app/utils/home_page.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final String apiUrl = 'http://172.18.0.3:8080/auth';
  String token = '';

  Future<void> authenticate() async {
    final Map<String, String> requestBody = {
      'username': 'danik',
      'password': '123',
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      setState(() {
        token = responseJson['token'];
      });
    } else {
      // Обработка ошибки
      print('Ошибка авторизации: ${response.statusCode}');
      print('Сообщение об ошибке: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизация'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await authenticate();
                if (token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home', arguments: token);
    }
              },
              child: Text('Войти'),
            ),
            SizedBox(height: 20),
            Text('Токен: $token'),
          ],
        ),
      ),
    );
  }
}