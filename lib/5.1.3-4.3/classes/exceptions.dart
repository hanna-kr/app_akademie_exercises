class ImagePickerException implements Exception {
  String cause;

  ImagePickerException({required this.cause});
}

class DeactivatedCamera implements Exception {
  String cause;

  DeactivatedCamera({required this.cause});
}

class SomethingWentWrong implements Exception {
  String cause;

  SomethingWentWrong({required this.cause});
}
