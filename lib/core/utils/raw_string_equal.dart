extension RawStringEqual on String {
  String _trimLower() => trim().toLowerCase();
  bool isRawEqual(String other) => _trimLower() == other._trimLower();
}
