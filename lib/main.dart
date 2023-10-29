import 'package:flutter/material.dart';
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
      home: HomeScreen(),
    );
  }
} 