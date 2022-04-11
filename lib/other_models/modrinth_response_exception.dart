class ModrinthResponseException implements Exception {
  final int _statusCode;

  ModrinthResponseException(int statusCode) : _statusCode = statusCode;

  int get statusCode => _statusCode;

  String get description => _getStatusCodeDescription(_statusCode);

  @override
  String toString() =>
      'ModrinthResponseException from the response: $_statusCode - $description';
}

String _getStatusCodeDescription(int statusCode) {
  switch (statusCode) {
    case 200:
      return 'Expected response to be a valid request';
    case 201:
      return 'Created';
    case 202:
      return 'Accepted';
    case 204:
      return 'No Content';
    case 400:
      return 'Bad Request';
    case 401:
      return 'Unauthorized';
    case 403:
      return 'Forbidden';
    case 404:
      return 'The requested version was not found or no authorization to see this version';
    case 405:
      return 'Method Not Allowed';
    case 409:
      return 'Conflict';
    case 500:
      return 'Internal Server Error';
    case 501:
      return 'Not Implemented';
    default:
      return 'HTTP $statusCode';
  }
}
