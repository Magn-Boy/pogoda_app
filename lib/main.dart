import 'package:Wheather/media.dart';
import 'package:Wheather/ui/utils/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/styles/constant.dart';
import 'ui/theme/theme_manager.dart';
import 'ui/utils/home_page.dart';

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
    Media.init(context);
    return MaterialApp(
      theme: AppPallete.lightTheme,
      darkTheme: AppPallete.darkTheme,
      themeMode: Provider.of<ThemeManager>(context).themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthScreen(),
        '/home':(context) => HomeScreen()
      },
    );
  }
} 