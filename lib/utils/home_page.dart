import 'package:flutter/material.dart';
import 'package:pogoda_app/Theme/theme_cobstant.dart';
import 'package:pogoda_app/widgets/switch_widget.dart';
import 'package:provider/provider.dart';
import '../Theme/theme_manager.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeManager _themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeManager.themeMode == ThemeMode.dark
             ? COLOR_THEME_DARK
             : COLOR_THEME_LIGHT,
        leading: SwitchWidget(
          value: _themeManager.themeMode == ThemeMode.dark,
          onChanged: (newValue) {
            _themeManager.toggleTheme(newValue);
          },
        ),
        toolbarHeight: 65,
        actions: [
          IconButton(
            icon: Icon(
              Icons.location_on_outlined,
              color: _themeManager.themeMode == ThemeMode.dark
            ? Colors.white
            : Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Center(
          child: Container(
            padding: EdgeInsets.only(top: 35, bottom: 15, left: 70, right: 70),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide(
                    color: _themeManager.themeMode == ThemeMode.dark
                        ? Colors.black
                        : Colors.black,
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  top: 40,
                  left: 12,
                  right: 12,
                  bottom: 8,
                ),
                labelText: 'Search for your preferred city',
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: _themeManager.themeMode == ThemeMode.dark
                  ? Colors.white
                  : Colors.black,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
          gradient: _themeManager.themeMode == ThemeMode.dark
            ? backgroundScaffoldGradiendDark
            : backgroundScaffoldGradientLight,
        ),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 380,
                  height: 200,
                  decoration: BoxDecoration(
                    color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_THEME_DARK
                          : COLOR_THEME_LIGHT,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                      color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_BLOCK_DARK
                          : COLOR_BLOCK_LIGHT, // Цвет тени
                      offset: Offset(0, 0), // Смещение тени по горизонтали и вертикали
                      blurRadius: 0.4, // Радиус размытия тени
                      spreadRadius: 0.0, // Распространение тени
                      ),
                      BoxShadow(
                      color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_BLOCK_DARK
                          : COLOR_BLOCK_LIGHT, // Цвет тени
                      offset: Offset(0, 8), // Смещение тени по горизонтали и вертикали
                      blurRadius: 4.0, // Радиус размытия тени
                      spreadRadius: 0.0, // Распространение тени
                      ),
                      BoxShadow(
                      color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_BLOCK_DARK
                          : COLOR_BLOCK_LIGHT, // Цвет тени
                      offset: Offset(8, 0), // Смещение тени по горизонтали и вертикали
                      blurRadius: 4.0, // Радиус размытия тени
                      spreadRadius: 0.0, // Распространение тени
                      )
                    ],
                  ),
                  child: Column(children: [
                    SizedBox(height: 30),
                    Text(
                      "Athens",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "09:03",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 1),
                    Text(
                      "Thursday, 31 Aug",
                      style: TextStyle(fontSize: 15),
                    ),
                  ]),
                ),
              ),
              Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 380,
                      height: 320,
                      decoration: BoxDecoration(
                        color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_THEME_DARK
                          : COLOR_THEME_LIGHT,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                      BoxShadow(
                      color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_BLOCK_DARK
                          : COLOR_BLOCK_LIGHT, // Цвет тени
                      offset: Offset(0, 0), // Смещение тени по горизонтали и вертикали
                      blurRadius: 4.0, // Радиус размытия тени
                      spreadRadius: 0.0, // Распространение тени
                      ),
                      BoxShadow(
                      color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_BLOCK_DARK
                          : COLOR_BLOCK_LIGHT, // Цвет тени
                      offset: Offset(0, 8), // Смещение тени по горизонтали и вертикали
                      blurRadius: 4.0, // Радиус размытия тени
                      spreadRadius: 1.0, // Распространение тени
                      ),
                      BoxShadow(
                      color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_BLOCK_DARK
                          : COLOR_BLOCK_LIGHT, // Цвет тени
                      offset: Offset(8, 0), // Смещение тени по горизонтали и вертикали
                      blurRadius: 4.0, // Радиус размытия тени
                      spreadRadius: 1.0, // Распространение тени
                      )
                    ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text(
                            "5 Days Forecast:",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/clouds.png',
                                  width: 45,
                                  height: 45,
                                ),
                                SizedBox(width: 25),
                                Expanded(
                                  child: Text(
                                    "20°C",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "Friday, 1 Sep",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/mist.png',
                                  width: 45,
                                  height: 45,
                                ),
                                SizedBox(width: 25),
                                Expanded(
                                  child: Text(
                                    "22°C",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "Saturday, 2 Sep",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/clear.png',
                                  width: 45,
                                  height: 45,
                                ),
                                SizedBox(width: 25),
                                Expanded(
                                  child: Text(
                                    "27°C",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "Sunday, 3 Sep",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/drizzle.png',
                                  width: 45,
                                  height: 45,
                                ),
                                SizedBox(width: 25),
                                Expanded(
                                  child: Text(
                                    "18°C",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "Monday, 4 Sep",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/rain.png',
                                  width: 45,
                                  height: 45,
                                ),
                                SizedBox(width: 25),
                                Expanded(
                                  child: Text(
                                    "16°C",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "Tuesday, 5 Sep",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 380,
                  height: 430,
                  decoration: BoxDecoration(
                        color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_THEME_DARK
                          : COLOR_THEME_LIGHT,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                      BoxShadow(
                      color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_BLOCK_DARK
                          : COLOR_BLOCK_LIGHT, // Цвет тени
                      offset: Offset(0, 0), // Смещение тени по горизонтали и вертикали
                      blurRadius: 0.0, // Радиус размытия тени
                      spreadRadius: 0.0, // Распространение тени
                      ),
                      BoxShadow(
                      color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_BLOCK_DARK
                          : COLOR_BLOCK_LIGHT, // Цвет тени
                      offset: Offset(0, 8), // Смещение тени по горизонтали и вертикали
                      blurRadius: 4.0, // Радиус размытия тени
                      spreadRadius: 0.0, // Распространение тени
                      ),
                      BoxShadow(
                      color: _themeManager.themeMode == ThemeMode.dark
                          ? COLOR_BLOCK_DARK
                          : COLOR_BLOCK_LIGHT, // Цвет тени
                      offset: Offset(8, 0), // Смещение тени по горизонтали и вертикали
                      blurRadius: 4.0, // Радиус размытия тени
                      spreadRadius: 0.0, // Распространение тени
                      )
                    ],
                      ),
                  child: Column(children: [
                    SizedBox(height: 15),
                    Text(
                      "Hourly Forecast:",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 5),
                          child: Container(
                            width: 85,
                            height: 170,
                            decoration: BoxDecoration(
                                gradient: _themeManager.themeMode == ThemeMode.dark? backgroundGradientl : backgroundGradientLight,
                                borderRadius: BorderRadius.circular(26)),
                            child: Column(children: [
                              SizedBox(height: 15),
                              Text("12:00",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              Image.asset('assets/images/clear.png',
                                  width: 50, height: 50),
                              Text("26°C",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Image.asset('assets/images/navigation_1.png',
                                  width: 35, height: 35),
                              SizedBox(height: 3),
                              Text("3km/h",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold)),
                            ]),
                          ),
                        ),
                        Container(
                          width: 85,
                          height: 170,
                          decoration: BoxDecoration(
                              gradient: _themeManager.themeMode == ThemeMode.dark? backgroundGradientl : backgroundGradientLight,
                              borderRadius: BorderRadius.circular(26)),
                          child: Column(children: [
                            SizedBox(height: 15),
                            Text("15:00",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Image.asset('assets/images/clear.png',
                                width: 50, height: 50),
                            Text("27°C",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Image.asset('assets/images/navigation_2.png',
                                width: 43, height: 43),
                            Text("2km/h",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 85,
                            height: 170,
                            decoration: BoxDecoration(
                                gradient: _themeManager.themeMode == ThemeMode.dark? backgroundGradientl : backgroundGradientLight,
                                borderRadius: BorderRadius.circular(26)),
                            child: Column(children: [
                              SizedBox(height: 15),
                              Text("18:00",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              Image.asset('assets/images/clouds.png',
                                  width: 50, height: 50),
                              Text("26°C",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Image.asset('assets/images/navigation_1.png',
                                  width: 35, height: 35),
                              SizedBox(height: 3),
                              Text("3km/h",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold)),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 68),
                          child: Container(
                            width: 85,
                            height: 170,
                            decoration: BoxDecoration(
                                gradient: _themeManager.themeMode == ThemeMode.dark? backgroundGradientl : backgroundGradientDark,
                                borderRadius: BorderRadius.circular(26)),
                            child: Column(children: [
                              SizedBox(height: 15),
                              Text("21:00",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              Image.asset('assets/images/clouds.png',
                                  width: 50, height: 50),
                              Text("25°C",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold)),
                              Image.asset('assets/images/navigation_3.png',
                                  width: 43, height: 43),
                              Text("3km/h",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold)),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: 85,
                            height: 170,
                            decoration: BoxDecoration(
                                gradient: _themeManager.themeMode == ThemeMode.dark? backgroundGradientl : backgroundGradientDark,
                                borderRadius: BorderRadius.circular(26)),
                            child: Column(children: [
                              SizedBox(height: 15),
                              Text("00:00",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                              Image.asset('assets/images/clouds.png',
                                  width: 50, height: 50),
                              Text("22°C",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Image.asset('assets/images/navigation_1.png',
                                  width: 35, height: 35),
                              SizedBox(height: 3),
                              Text("3km/h",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold)),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
