import 'package:flutter/foundation.dart';

class AppException implements Exception {
  late final String message;
  late final String _prefix;
  late final String _displayMessage;

  AppException(this._prefix, this.message, this._displayMessage);

  @override
  String toString() {
    debugPrint(message);
    return "$_prefix$_displayMessage";
  }
}

class FetchDataException extends AppException {
  FetchDataException(message, displayMessage)
      : super("Error During Communication: ", message, displayMessage);
}

class BadRequestException extends AppException {
  BadRequestException(message, displayMessage)
      : super("Invalid Request: ", message, displayMessage);
}

class UnauthorisedException extends AppException {
  UnauthorisedException(message, displayMessage)
      : super("Unauthorised: ", message, displayMessage);
}

class InvalidInputException extends AppException {
  InvalidInputException(message, displayMessage)
      : super("Invalid Input: ", message, displayMessage);
}

class CustomErrorException extends AppException {
  CustomErrorException(prefix, message, displayMessage)
      : super(prefix, message, displayMessage);
}
