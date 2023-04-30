class AppException implements Exception {
  AppException([this._message, this._prefix]);

  final String? _message;
  final dynamic _prefix;

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

//----------status code default-----------//
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

//----------status code 400-----------//
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

//----------status code 500-----------//
class UnautharisedException extends AppException {
  UnautharisedException([String? message])
      : super(message, 'Unauthorised Request');
}

//----------status code 504-----------//
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
