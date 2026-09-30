class CurrentWeatherModel {
  const CurrentWeatherModel({
    required this.date,
    required this.tempC,
    required this.humidity,
    required this.conditionText,
    required this.conditionCode,
    required this.feelsLikeC,
  });

  final DateTime date;
  final double tempC;
  final double feelsLikeC;
  final int humidity;
  final String conditionText;
  final int conditionCode;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    final condition = json["condition"] as Map<String, dynamic>;

    return CurrentWeatherModel(
      date: DateTime.parse(json["date"] as String),
      tempC: (json["temp_c"] as num).toDouble(),
      humidity: json["humidity"] as int,
      conditionText: condition["text"] as String,
      conditionCode: condition["code"] as int,
      feelsLikeC: (json["feelslike_c"] as num).toDouble(),
    );
  }
}
