import 'package:flutter/material.dart';

 LinearGradient backgroundGradientLight = LinearGradient(
  colors: [Colors.orange[500]!, Colors.orange[100]!],
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
);

LinearGradient backgroundScaffoldGradientLight = LinearGradient(
  colors: [Color(0xFFFFFFFF), Color(0xFFB2BBC9)],
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  stops: [0.0, 0.6],
);

LinearGradient backgroundScaffoldGradiendDark = LinearGradient(
  colors: [Color(0xFF4B4B4B), Color(0xFF313131)],
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  stops: [0.0, 0.6],
);

LinearGradient backgroundScaffoldGradientDark = LinearGradient(
  colors: [Colors.orange[500]!, Colors.orange[100]!],
  begin: Alignment.topCenter,
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

LinearGradient backgroundGradientl = LinearGradient(
  colors: [ Color.fromARGB(255, 44, 44, 44),
  Color.fromARGB(255, 44, 44, 44) 
  ],
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: COLOR_THEME_DARK,
  // Другие параметры темы
);

ThemeData lightTheme =
    ThemeData(brightness: Brightness.light,
     primaryColor: COLOR_THEME_LIGHT
);

const COLOR_THEME_DARK = Color(0xFF444444);
const COLOR_THEME_LIGHT = Color(0xFFD9D9D9);
const COLOR_BLOCK_LIGHT = Color.fromARGB(255, 103, 103, 103);
const COLOR_BLOCK_DARK = Color.fromARGB(255, 31, 31, 31);