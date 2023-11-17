class ApiException implements Exception {
  final String _message;
  ApiException(this._message);

  void main() {
    try {
      throwException();
    } on ApiException catch (e) {
      print(e);
    }
  }

  @override
  String toString() {
    return _message;
  }

  void throwException() {
    throw ApiException(_message);
  }
}
