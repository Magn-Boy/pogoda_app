import 'package:flutter/material.dart';
import 'package:pogoda_app/Api/auth.dart';
import 'package:provider/provider.dart';

import 'Theme/theme_cobstant.dart';
import 'Theme/theme_manager.dart';
import 'utils/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<ThemeManager>(context).themeMode,
      home: AuthScreen(),
       routes: {
        '/auth': (context) => AuthScreen(),
        '/home': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is String) {
            return HomeScreen(token: arguments);
          }
          // Handle the case when arguments is not a String (or null) here.
          // You can return an appropriate widget or handle the error as needed.
          return Container();
        },
      },
      initialRoute: '/auth',
    );
  }
} 