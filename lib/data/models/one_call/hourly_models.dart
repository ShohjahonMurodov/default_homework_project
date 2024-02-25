import 'package:homework/data/models/both_models/in_weather_model.dart';

class HourlyModels {
  HourlyModels(
      {required this.dt,
      required this.temp,
      required this.feelsLike,
      required this.pressure,
      required this.humidity,
      required this.dewPoint,
      required this.uvi,
      required this.clouds,
      required this.visibility,
      required this.windSpeed,
      required this.windDeg,
      required this.windGust,
      required this.pop,
      required this.inWeather});

  final num dt;
  final num temp;
  final num feelsLike;
  final num pressure;
  final num humidity;
  final num dewPoint;
  final num uvi;
  final num clouds;
  final num visibility;
  final num windSpeed;
  final num windDeg;
  final num windGust;
  final num pop;
  final List<InWeather> inWeather;

  factory HourlyModels.fromJson(Map<String, dynamic> json) {
    return HourlyModels(
      dt: json["dt"] as num? ?? 0,
      temp: json["temp"] as num? ?? 0.0,
      feelsLike: json["feels_like"] as num? ?? 0.0,
      pressure: json["pressure"] as num? ?? 0,
      humidity: json["humidity"] as num? ?? 0,
      dewPoint: json["dew_point"] as num? ?? 0.0,
      uvi: json["uvi"] as num? ?? 0.0,
      clouds: json["clouds"] as num? ?? 0,
      visibility: json["visibility"] as num? ?? 0,
      windSpeed: json["wind_speed"] as num? ?? 0.0,
      windDeg: json["wind_deg"] as num? ?? 0,
      windGust: json["wind_gust"] as num? ?? 0.0,
      pop: json["pop"] as num? ?? 0.0,
      inWeather: (json["weather"] as List?)
              ?.map((e) => InWeather.fromJson(e))
              .toList() ??
          [],
    );
  }
}
