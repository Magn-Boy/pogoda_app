class WeatherForecast {
  final String dt;
  final Main main;
  final List<Weather> weather;
  final Wind wind;

  WeatherForecast({required this.dt, required this.main, required this.weather, required this.wind});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      dt: json['dt'],
      main: Main.fromJson(json['main']),
      weather: (json['weather'] as List).map((i) => Weather.fromJson(i)).toList(),
      wind: Wind.fromJson(json['wind']),
    );
  }
}

class Main {
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double tempMin;
  final double tempMax;

  Main({required this.temp, required this.feelsLike, required this.pressure, required this.humidity, required this.tempMin, required this.tempMax});

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
    );
  }
}

class Weather {
  final int id;
  final String main;
  final String description;

  Weather({required this.id, required this.main, required this.description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
    );
  }
}

class Wind {
  final double speed;
  final int deg;
  final double gust;

  Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust'].toDouble(),
    );
  }
}
