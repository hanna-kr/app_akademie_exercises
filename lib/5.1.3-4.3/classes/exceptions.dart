class ImagePickerException implements Exception {
  String cause;

  ImagePickerException({required this.cause});
}

class DeactivatedCamera implements Exception {
  String cause;

  DeactivatedCamera({required this.cause});
}

class NetworkProblems implements Exception {
  String cause;

  NetworkProblems({required this.cause});
}
