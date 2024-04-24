import 'dart:convert';
import 'package:Wheather/data/daily_weather/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthToken {
  final String baseUrl = 'http://192.168.100.63:8080';
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

class AuthModel extends ChangeNotifier {
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;

  Future<void> auth() async {

  }
}

class AuthProvider extends InheritedWidget {
  final AuthModel model;

  const AuthProvider({super.key, required Widget child, required this.model})
      : super(
          child: child,
        );

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }

  AuthModel getModel() {
    return model;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw UnimplementedError();
  }
}
