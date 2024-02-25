class MainModel {
  MainModel(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity});

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      temp: json["temp"] as double? ?? 0,
      feelsLike: json["feels_like"] as double? ?? 0,
      tempMin: json["temp_min"] as double? ?? 0,
      tempMax: json["temp_max"] as double? ?? 0,
      pressure: json["pressure"] as int? ?? 0,
      humidity: json["humidity"] as int? ?? 0,
    );
  }
}
