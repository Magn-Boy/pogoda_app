import 'package:flutter/material.dart';

 LinearGradient backgroundGradientLight = LinearGradient(
  colors: [Colors.orange[500]!, Colors.orange[100]!],
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
);

LinearGradient backgroundGradientDark = LinearGradient(
  colors: [ const Color.fromRGBO(68, 61, 100, 1), 
  Color.fromARGB(255, 159, 152, 192)
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0,1.0],
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
