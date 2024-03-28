import 'dart:convert';
import 'package:Wheather/data/daily_weather/model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthToken {
  static final String _token = 'token';
  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_token, token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }
}

class ApiService {
  final String baseUrl = 'http://192.168.100.63:8080';
  final AuthToken _authToken = AuthToken();

  Future<List<WeatherData>> fetchWeatherData() async {
    try {
      final token = await _authToken.getToken();
      if (token == null) {
        throw Exception('Token is null');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/getDailyWeather?city=Minsk'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<WeatherData> weatherDataList = [];

        for (final Map<String, dynamic> data in jsonData) {
          weatherDataList.add(WeatherData.fromJson(data));
        }
        return weatherDataList;
      } else {
        print('Failed to load weather data: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load weather data: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error fetching weather data: $error');
      throw Exception('Failed to load weather data: $error');
    }
  }
}