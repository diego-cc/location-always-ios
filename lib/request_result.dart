class RequestResult {
  final bool? success;
  final String? message;
  final String? error;

  RequestResult({
    this.success,
    this.message,
    this.error,
  });

  factory RequestResult.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return RequestResult(
        success: false,
        error:
            'No response was received from the platform channel method call.',
      );
    }
    return RequestResult(
      success: map['success'] as bool?,
      message: map['message'] as String?,
      error: map['error'] as String?,
    );
  }
}
