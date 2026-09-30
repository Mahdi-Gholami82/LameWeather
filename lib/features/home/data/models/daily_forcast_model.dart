class DailyForcastModel {
  const DailyForcastModel({
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.conditionText,
    required this.conditionCode,
  });

  final DateTime date;
  final double minTemperature;
  final double maxTemperature;
  final int humidity;
  final String conditionText;
  final int conditionCode;

  factory DailyForcastModel.fromJson(Map<String, dynamic> json) {
    final day = json["day"] as Map<String, dynamic>;
    final condition = day["condition"] as Map<String, dynamic>;

    return DailyForcastModel(
      date: DateTime.parse(json["date"] as String),
      minTemperature: (day["mintemp_c"] as num).toDouble(),
      maxTemperature: (day["maxtemp_c"] as num).toDouble(),
      humidity: day["avghumidity"] as int,
      conditionText: condition["text"] as String,
      conditionCode: condition["code"] as int,
    );
  }
}
