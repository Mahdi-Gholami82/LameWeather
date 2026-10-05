class HourlyForecastModel {
  const HourlyForecastModel({
    required this.dateTime,
    required this.temperature,
    required this.feelsLikeTemperature,
    required this.humidity,
    required this.conditionText,
    required this.conditionCode,
  });

  final DateTime dateTime;
  final double temperature;
  final double feelsLikeTemperature;
  final int humidity;
  final String conditionText;
  final int conditionCode;

  factory HourlyForecastModel.fromJson(Map<String, dynamic> json) {
    final condition = json["condition"] as Map<String, dynamic>;

    return HourlyForecastModel(
      dateTime: DateTime.parse(json["time"] as String),
      temperature: (json["temp_c"] as num).toDouble(),
      feelsLikeTemperature: (json["feelslike_c"] as num).toDouble(),
      humidity: json["humidity"] as int,
      conditionText: condition["text"] as String,
      conditionCode: condition["code"] as int,
    );
  }
}
