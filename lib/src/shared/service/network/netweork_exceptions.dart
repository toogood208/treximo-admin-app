class NetweorkExceptions implements Exception {
  late String message;

  static String handleError({int? statusCode, dynamic error}) {
    switch (statusCode) {
      case 400:
        return error['message'];
      case 401:
        return error['message'];
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return 'Internal server error';
      case 422:
        return 'Please ensure all required fields have been filled';
      case 502:
        return 'Bad gateway';
      case 521:
        return 'Web server is down, please try again later';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
