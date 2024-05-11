class ServerException implements Exception {

  ServerException({
    this.message,
    this.code,
    this.path,
    this.errors,
  });

  final String? message;
  final dynamic errors;
  final int? code;
  final String? path;

  @override
  String toString() => message.toString();
}
