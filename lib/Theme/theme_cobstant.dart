import 'package:flutter/material.dart';

 LinearGradient backgroundGradientLight = LinearGradient(
  colors: [Colors.white, Colors.grey],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 0.6],
);

LinearGradient backgroundGradientDark = LinearGradient(
  colors: [Colors.grey[800]!,
  Colors.grey[850]!,
  Colors.grey[900]!
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.4, 0.7, 0.9],
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black54,
  // Другие параметры темы
);

ThemeData lightTheme =
    ThemeData(brightness: Brightness.light,
     primaryColor: Colors.white
);
