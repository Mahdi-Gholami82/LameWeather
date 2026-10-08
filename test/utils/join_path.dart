import 'dart:io';

String joinPaths(List<String> segments) {
  return segments.where((s) => s.isNotEmpty).join(Platform.pathSeparator);
}
