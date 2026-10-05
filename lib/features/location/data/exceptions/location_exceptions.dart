class LocationPermissionDeniedException implements Exception {
  @override
  String toString() => "The location permission is denied";
}

class LocationPermissionPermanentlyDeniedException implements Exception {
  @override
  String toString() => "The location permission is permanently denied";
}
