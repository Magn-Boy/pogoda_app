import 'package:flutter/material.dart';
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
      body: Column(
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
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                SizedBox(height: 15),
                Text(
                  "09:03",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
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
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Text(
                  "5 Days Forecast:",
                  style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                ), 
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Row(
                          children: [
                            Image.asset('assets/images/clouds.png',width: 40, height: 40,),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                "20°C",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                            ),
                              Text(
                                "Friday, 1 Sep",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Row(
                          children: [
                            Image.asset('assets/images/mist.png',width: 40, height: 40,),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                "22°C",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                            ),
                              Text(
                                "Saturday, 2 Sep",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Row(
                          children: [
                            Image.asset('assets/images/clear.png',width: 40, height: 40,),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                "27°C",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                            ),
                              Text(
                                "Sunday, 3 Sep",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Row(
                          children: [
                            Image.asset('assets/images/drizzle.png',width: 40, height: 40,),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                "18°C",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                            ),
                              Text(
                                "Monday, 4 Sep",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        child: Row(
                          children: [
                            Image.asset('assets/images/rain.png',width: 40, height: 40,),
                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                "16°C",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                            ),
                              Text(
                                "Tuesday, 5 Sep",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  )
            )
          ) 
        ],
      ),
    );
  }
}
