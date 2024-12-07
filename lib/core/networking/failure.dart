class Failure {
  final String message;
  final int? code; // Optional error code

  Failure(this.message, {this.code});

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}
