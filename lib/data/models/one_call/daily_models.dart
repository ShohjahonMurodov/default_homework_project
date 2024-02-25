import 'package:homework/data/models/both_models/in_weather_model.dart';
import 'package:homework/data/models/one_call/feels_like_models.dart';
import 'package:homework/data/models/one_call/temp_model.dart';

class DailyModels {
  DailyModels({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.tempModel,
    required this.feelsLikeModels,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.inWeatherModel,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.snow,
    required this.uvi,
  });

  final num dt;
  final num sunrise;
  final num sunset;
  final num moonrise;
  final num moonset;
  final num moonPhase;
  final TempModel tempModel;
  final FeelsLikeModels feelsLikeModels;
  final num pressure;
  final num humidity;
  final num dewPoint;
  final num windSpeed;
  final num windDeg;
  final num windGust;
  final List<InWeather> inWeatherModel;
  final num clouds;
  final num pop;
  final num rain;
  final num snow;
  final num uvi;

  factory DailyModels.fromJson(Map<String, dynamic> json) {
    return DailyModels(
      feelsLikeModels: FeelsLikeModels.fromJson(json['feels_like']),
      tempModel: TempModel.fromJson(json['temp']),
      windSpeed: json['wind_speed'] as num? ?? 0.0,
      windGust: json['wind_gust'] as num? ?? 0.0,
      windDeg: json['wind_deg'] as num? ?? 0,
      uvi: json['uvi'] as num? ?? 0.0,
      dewPoint: json["dew_point"] as num? ?? 0.0,
      pop: json["pop"] as num? ?? 0.0,
      humidity: json['humidity'] as num? ?? 0,
      clouds: json['clouds'] as num? ?? 0,
      pressure: json['pressure'] as num? ?? 0,
      dt: json['dt'] as num? ?? 0,
      inWeatherModel: (json['weather'] as List?)
              ?.map((e) => InWeather.fromJson(e))
              .toList() ??
          [],
      sunset: json['sunset'] as num? ?? 0,
      sunrise: json['sunrise'] as num? ?? 0,
      moonPhase: json['moon_phase'] as num? ?? 0.0,
      moonrise: json['moonrise'] as num? ?? 0,
      moonset: json['moonset'] as num? ?? 0,
      rain: json["rain"] as num? ?? 0.0,
      snow: json["snow"] as num? ?? 0.0,
    );
  }
}
