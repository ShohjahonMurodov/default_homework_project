import 'package:homework/data/models/one_call/daily_models.dart';
import 'package:homework/data/models/one_call/hourly_models.dart';

class OneCallDataModels {
  OneCallDataModels({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.hourlyModels,
    required this.dailyModels,
  });

  final dynamic lat;
  final dynamic lon;
  final String timezone;
  final dynamic timezoneOffset;
  final List<HourlyModels> hourlyModels;
  final List<DailyModels> dailyModels;

  factory OneCallDataModels.fromJson(Map<String, dynamic> json) {
    return OneCallDataModels(
      lat: json["lat"] as dynamic? ?? 0.0,
      lon: json["lon"] as dynamic? ?? 0.0,
      timezone: json["timezone"] as String? ?? "",
      timezoneOffset: json["timezone_offset"] as dynamic? ?? 0,
      hourlyModels: (json["hourly"] as List?)
              ?.map((e) => HourlyModels.fromJson(e))
              .toList() ??
          [],
      dailyModels: (json["daily"] as List?)
              ?.map((e) => DailyModels.fromJson(e))
              .toList() ??
          [],
    );
  }
}
