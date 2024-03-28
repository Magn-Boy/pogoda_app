class WeatherData {
  final DateTime dt;
  final MainData main;
  final List<Weather> weather;
  final Wind wind;

  WeatherData({
    required this.dt,
    required this.main,
    required this.weather,
    required this.wind,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      dt: DateTime.parse(json['dt']),
      main: MainData.fromJson(json['main']),
      weather: (json['weather'] as List<dynamic>)
          .map((item) => Weather.fromJson(item))
          .toList(),
      wind: Wind.fromJson(json['wind']),
    );
  }
}

class MainData {
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double tempMin;
  final double tempMax;

  MainData({
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.tempMin,
    required this.tempMax,
  });

  factory MainData.fromJson(Map<String, dynamic> json) {
    return MainData(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
    );
  }
}

class Weather {
  final int id;
  final String main;
  final String description;

  Weather({
    required this.id,
    required this.main,
    required this.description,
  });

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

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'],
      deg: json['deg'],
      gust: json['gust'],
    );
  }
}
