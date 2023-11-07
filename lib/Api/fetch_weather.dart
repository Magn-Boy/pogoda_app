import 'dart:convert';
import 'package:http/http.dart' as http;

Future<double> fetchWeather() async {
  double temperature = 0.0;
  final response = await http.get(Uri.parse('http://172.18.0.3:8080/getCurrentWeather?city=minsk'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    temperature = data['temp']; // Предполагается, что в ответе от сервера есть ключ 'temp'
  } else {
    throw Exception('Failed to load data');
  }

  return temperature;
}