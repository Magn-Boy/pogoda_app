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
      backgroundColor: _themeManager.themeMode == ThemeMode.dark
          ? Colors.grey[800]
          : Colors.grey[400]!,
      appBar: AppBar(
        backgroundColor: _themeManager.themeMode == ThemeMode.dark
            ? Colors.grey[700]!
            : Colors.grey[300]!,
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
              color: Colors.black54,
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
                  color: Colors.black,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 380,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  SizedBox(height: 30),
                  Text(
                    "Athens",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "09:03",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    "Thursday, 31 Aug",
                    style: TextStyle(color: Colors.black, fontSize: 15),
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
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text(
                          "5 Days Forecast:",
                          style: TextStyle(
                              color: Colors.black,
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
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  SizedBox(height: 15),
                  Text(
                    "Hourly Forecast:",
                    style: TextStyle(
                        color: Colors.black,
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
                              gradient: backgroundGradientLight,
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
                            gradient: backgroundGradientLight,
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
                              gradient: backgroundGradientLight,
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
                              gradient: backgroundGradientDark,
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
                              gradient: backgroundGradientDark,
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
    );
  }
}
