const _weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

String weekDayFormatter(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(date.year, date.month, date.day);
  final diff = target.difference(today).inDays;

  if (diff == 0) return "Today";

  return _weekdays[date.weekday - 1];
}
