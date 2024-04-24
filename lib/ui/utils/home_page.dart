import 'dart:convert';
import 'package:Wheather/data/auth/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:Wheather/data/daily_weather/model.dart';
import 'package:Wheather/ui/styles/assets.dart';
import 'package:Wheather/ui/styles/text_style.dart';
import 'package:Wheather/ui/styles/constant.dart';
import 'package:Wheather/media.dart';
import 'package:Wheather/widgets/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_manager.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherForecast? weather;
  @override
  Widget build(BuildContext context) {
    ThemeManager _themeManager = Provider.of<ThemeManager>(context);
    String minsk = "Minsk";
    int today = DateTime.now().day;
    final AuthToken _authToken = AuthToken();

    Future<List<WeatherForecast>> fetchWeatherData() async {
    try {
      final token = await _authToken.getToken();
      if (token == null) {
        throw Exception('Token is null');
      }

      final response = await http.get(
        Uri.parse('${_authToken.baseUrl}/getDailyWeather?city=Minsk'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<WeatherForecast> weatherDataList = [];

        for (final Map<String, dynamic> data in jsonData) {
          weatherDataList.add(WeatherForecast.fromJson(data));
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: _themeManager.themeMode == ThemeMode.dark
              ? AppPallete.COLOR_THEME_DARK
              : AppPallete.COLOR_THEME_LIGHT,
          leading: SwitchWidget(
            value: _themeManager.themeMode == ThemeMode.dark,
            onChanged: (newValue) {
              _themeManager.toggleTheme(newValue);
            },
          ),
          title: Container(
            width: Media.screenWidth / 1.37,
            height: Media.screenHeight * 0.04,
            child: TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: BorderSide(
                    color: _themeManager.themeMode == ThemeMode.dark
                        ? Colors.black
                        : Colors.black,
                  ),
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
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: _themeManager.themeMode == ThemeMode.dark
                      ? AppPallete.backgroundScaffoldGradiendDark
                      : AppPallete.backgroundScaffoldGradientLight,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: Media.screenWidth / 1.08,
                        height: Media.screenHeight / 3.99,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: _themeManager.themeMode == ThemeMode.dark
                              ? AppPallete.COLOR_THEME_DARK
                              : AppPallete.COLOR_THEME_LIGHT,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: _themeManager.themeMode == ThemeMode.dark
                                  ? AppPallete.COLOR_BLOCK_DARK
                                  : AppPallete.COLOR_BLOCK_LIGHT, // Цвет тени
                              offset: Offset(0,
                                  0), // Смещение тени по горизонтали и вертикали
                              blurRadius: 0.4, // Радиус размытия тени
                              spreadRadius: 0.0, // Распространение тени
                            ),
                            BoxShadow(
                              color: _themeManager.themeMode == ThemeMode.dark
                                  ? AppPallete.COLOR_BLOCK_DARK
                                  : AppPallete.COLOR_BLOCK_LIGHT, // Цвет тени
                              offset: Offset(0,
                                  8), // Смещение тени по горизонтали и вертикали
                              blurRadius: 4.0, // Радиус размытия тени
                              spreadRadius: 0.0, // Распространение тени
                            ),
                            BoxShadow(
                              color: _themeManager.themeMode == ThemeMode.dark
                                  ? AppPallete.COLOR_BLOCK_DARK
                                  : AppPallete.COLOR_BLOCK_LIGHT, // Цвет тени
                              offset: Offset(8,
                                  0), // Смещение тени по горизонтали и вертикали
                              blurRadius: 4.0, // Радиус размытия тени
                              spreadRadius: 0.0, // Распространение тени
                            )
                          ],
                        ),
                        child: Column(children: [
                          Text(
                            "$minsk",
                            style: TextStyles.TITLE_25_BOLD,
                          ),
                          SizedBox(height: Media.screenHeight * 0.01),
                          Text(
                            '9:09',
                            style: TextStyles.TITLE_60_BOLD,
                          ),
                          SizedBox(height: Media.screenHeight * 0.01),
                          Text(
                            "$today",
                            style: TextStyles.TITLE_15_BOLD,
                          ),
                        ]),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        width: Media.screenWidth / 1.08,
                        height: Media.screenHeight / 2.85,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 4),
                        decoration: BoxDecoration(
                          color: _themeManager.themeMode == ThemeMode.dark
                              ? AppPallete.COLOR_THEME_DARK
                              : AppPallete.COLOR_THEME_LIGHT,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: _themeManager.themeMode == ThemeMode.dark
                                  ? AppPallete.COLOR_BLOCK_DARK
                                  : AppPallete.COLOR_BLOCK_LIGHT, // Цвет тени
                              offset: Offset(0,
                                  0), // Смещение тени по горизонтали и вертикали
                              blurRadius: 4.0, // Радиус размытия тени
                              spreadRadius: 0.0, // Распространение тени
                            ),
                            BoxShadow(
                              color: _themeManager.themeMode == ThemeMode.dark
                                  ? AppPallete.COLOR_BLOCK_DARK
                                  : AppPallete.COLOR_BLOCK_LIGHT, // Цвет тени
                              offset: Offset(0,
                                  8), // Смещение тени по горизонтали и вертикали
                              blurRadius: 4.0, // Радиус размытия тени
                              spreadRadius: 1.0, // Распространение тени
                            ),
                            BoxShadow(
                              color: _themeManager.themeMode == ThemeMode.dark
                                  ? AppPallete.COLOR_BLOCK_DARK
                                  : AppPallete.COLOR_BLOCK_LIGHT, // Цвет тени
                              offset: Offset(8,
                                  0), // Смещение тени по горизонтали и вертикали
                              blurRadius: 4.0, // Радиус размытия тени
                              spreadRadius: 1.0, // Распространение тени
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              "5 Days Forecast:",
                              style: TextStyles.TITLE_25_BOLD,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/clouds.png',
                                  width: 45,
                                  height: 45,
                                ),
                                SizedBox(width: Media.screenWidth * 0.06),
                                Text(
                                  '${weather!.main.temp}',
                                  style: TextStyles.TITLE_18_BOLD,
                                ),
                                Spacer(),
                                Text(
                                  "Friday, 1 Sep",
                                  style: TextStyles.TITLE_18_BOLD,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/mist.png',
                                  width: 45,
                                  height: 45,
                                ),
                                SizedBox(width: Media.screenWidth * 0.06),
                                Text(
                                  "22°C",
                                  style: TextStyles.TITLE_18_BOLD,
                                ),
                                Spacer(),
                                Text(
                                  "Saturday, 2 Sep",
                                  style: TextStyles.TITLE_18_BOLD,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/clear.png',
                                  width: 45,
                                  height: 45,
                                ),
                                SizedBox(width: Media.screenWidth * 0.06),
                                Text(
                                  "27°C",
                                  style: TextStyles.TITLE_18_BOLD,
                                ),
                                Spacer(),
                                Text(
                                  "Sunday, 3 Sep",
                                  style: TextStyles.TITLE_18_BOLD,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  Assets.drizzle,
                                  width: 45,
                                  height: 45,
                                ),
                                SizedBox(width: Media.screenWidth * 0.06),
                                Text(
                                  "18°C",
                                  style: TextStyles.TITLE_18_BOLD,
                                ),
                                Spacer(),
                                Text(
                                  "Monday, 4 Sep",
                                  style: TextStyles.TITLE_18_BOLD,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  Assets.rain,
                                  width: 45,
                                  height: 45,
                                ),
                                SizedBox(width: Media.screenWidth * 0.06),
                                Text(
                                  "16°C",
                                  style: TextStyles.TITLE_18_BOLD,
                                ),
                                Spacer(),
                                Text(
                                  "Tuesday, 5 Sep",
                                  style: TextStyles.TITLE_18_BOLD,
                                )
                              ],
                            ),
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: Media.screenWidth / 1.08,
                      height: Media.screenHeight / 1.83,
                      decoration: BoxDecoration(
                        color: _themeManager.themeMode == ThemeMode.dark
                            ? AppPallete.COLOR_THEME_DARK
                            : AppPallete.COLOR_THEME_LIGHT,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: _themeManager.themeMode == ThemeMode.dark
                                ? AppPallete.COLOR_BLOCK_DARK
                                : AppPallete.COLOR_BLOCK_LIGHT, // Цвет тени
                            offset: Offset(0,
                                0), // Смещение тени по горизонтали и вертикали
                            blurRadius: 0.0, // Радиус размытия тени
                            spreadRadius: 0.0, // Распространение тени
                          ),
                          BoxShadow(
                            color: _themeManager.themeMode == ThemeMode.dark
                                ? AppPallete.COLOR_BLOCK_DARK
                                : AppPallete.COLOR_BLOCK_LIGHT, // Цвет тени
                            offset: Offset(0,
                                8), // Смещение тени по горизонтали и вертикали
                            blurRadius: 4.0, // Радиус размытия тени
                            spreadRadius: 0.0, // Распространение тени
                          ),
                          BoxShadow(
                            color: _themeManager.themeMode == ThemeMode.dark
                                ? AppPallete.COLOR_BLOCK_DARK
                                : AppPallete.COLOR_BLOCK_LIGHT, // Цвет тени
                            offset: Offset(8,
                                0), // Смещение тени по горизонтали и вертикали
                            blurRadius: 4.0, // Радиус размытия тени
                            spreadRadius: 0.0, // Распространение тени
                          )
                        ],
                      ),
                      child: Column(children: [
                        SizedBox(height: Media.screenHeight * 0.01),
                        Text(
                          "Hourly Forecast:",
                          style: TextStyles.TITLE_25_BOLD,
                        ),
                        SizedBox(height: Media.screenHeight * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: Media.screenWidth / 4.83,
                              height: Media.screenHeight / 4.56,
                              decoration: BoxDecoration(
                                  gradient:
                                      _themeManager.themeMode == ThemeMode.dark
                                          ? AppPallete.backgroundGradientl
                                          : AppPallete.backgroundGradientLight,
                                  borderRadius: BorderRadius.circular(26)),
                              child: Column(children: [
                                SizedBox(height: Media.screenHeight * 0.01),
                                Text("12:00", style: TextStyles.TITLE_16_BOLD),
                                Image.asset(Assets.clear,
                                    width: 50, height: 50),
                                Text("26°C", style: TextStyles.TITLE_14_BOLD),
                                SizedBox(height: Media.screenHeight * 0.006),
                                Image.asset(Assets.arrow_up,
                                    width: 35, height: 35),
                                SizedBox(height: Media.screenHeight * 0.003),
                                Text("3km/h", style: TextStyles.TITLE_14_BOLD),
                              ]),
                            ),
                            SizedBox(width: Media.screenWidth * 0.04),
                            Container(
                              width: Media.screenWidth / 4.83,
                              height: Media.screenHeight / 4.56,
                              decoration: BoxDecoration(
                                  gradient:
                                      _themeManager.themeMode == ThemeMode.dark
                                          ? AppPallete.backgroundGradientl
                                          : AppPallete.backgroundGradientLight,
                                  borderRadius: BorderRadius.circular(26)),
                              child: Column(children: [
                                SizedBox(height: Media.screenHeight * 0.01),
                                Text("15:00", style: TextStyles.TITLE_16_BOLD),
                                Image.asset(Assets.clear,
                                    width: 50, height: 50),
                                Text("27°C", style: TextStyles.TITLE_14_BOLD),
                                Image.asset(Assets.arrow_left_up,
                                    width: 43, height: 43),
                                Text("2km/h", style: TextStyles.TITLE_14_BOLD),
                              ]),
                            ),
                            SizedBox(width: Media.screenWidth * 0.04),
                            Container(
                              width: Media.screenWidth / 4.83,
                              height: Media.screenHeight / 4.56,
                              decoration: BoxDecoration(
                                  gradient:
                                      _themeManager.themeMode == ThemeMode.dark
                                          ? AppPallete.backgroundGradientl
                                          : AppPallete.backgroundGradientLight,
                                  borderRadius: BorderRadius.circular(26)),
                              child: Column(children: [
                                SizedBox(height: Media.screenHeight * 0.01),
                                Text("18:00", style: TextStyles.TITLE_16_BOLD),
                                Image.asset(Assets.clouds,
                                    width: 50, height: 50),
                                Text("26°C", style: TextStyles.TITLE_14_BOLD),
                                SizedBox(height: Media.screenHeight * 0.006),
                                Image.asset(Assets.arrow_up,
                                    width: 35, height: 35),
                                SizedBox(height: Media.screenHeight * 0.003),
                                Text("3km/h", style: TextStyles.TITLE_14_BOLD),
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(height: Media.screenHeight * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: Media.screenWidth / 4.83,
                              height: Media.screenHeight / 4.56,
                              decoration: BoxDecoration(
                                  gradient:
                                      _themeManager.themeMode == ThemeMode.dark
                                          ? AppPallete.backgroundGradientl
                                          : AppPallete.backgroundGradientDark,
                                  borderRadius: BorderRadius.circular(26)),
                              child: Column(children: [
                                SizedBox(height: Media.screenHeight * 0.01),
                                Text("21:00", style: TextStyles.TITLE_16_BOLD),
                                Image.asset(Assets.clouds,
                                    width: 50, height: 50),
                                Text("25°C", style: TextStyles.TITLE_14_BOLD),
                                Image.asset(Assets.arrow_right_up,
                                    width: 43, height: 43),
                                Text("3km/h", style: TextStyles.TITLE_14_BOLD),
                              ]),
                            ),
                            SizedBox(width: Media.screenHeight * 0.02),
                            Container(
                              width: Media.screenWidth / 4.83,
                              height: Media.screenHeight / 4.56,
                              decoration: BoxDecoration(
                                  gradient:
                                      _themeManager.themeMode == ThemeMode.dark
                                          ? AppPallete.backgroundGradientl
                                          : AppPallete.backgroundGradientDark,
                                  borderRadius: BorderRadius.circular(26)),
                              child: Column(children: [
                                SizedBox(height: Media.screenHeight * 0.01),
                                Text("00:00", style: TextStyles.TITLE_16_BOLD),
                                Image.asset(Assets.clouds,
                                    width: 50, height: 50),
                                Text("22°C", style: TextStyles.TITLE_14_BOLD),
                                SizedBox(height: Media.screenHeight * 0.006),
                                Image.asset(Assets.arrow_up,
                                    width: 35, height: 35),
                                SizedBox(height: Media.screenHeight * 0.003),
                                Text("3km/h", style: TextStyles.TITLE_14_BOLD),
                              ]),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
