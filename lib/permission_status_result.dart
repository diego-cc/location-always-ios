import 'package:location_always_ios/permission_status.dart';

class PermissionStatusResult {
  final bool? success;
  final String? message;
  final String? error;

  PermissionStatusResult({
    this.success,
    this.message,
    this.error,
  });

  factory PermissionStatusResult.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return PermissionStatusResult(
        success: false,
        error:
            'No response was received from the platform channel method call.',
      );
    }

    return PermissionStatusResult(
      success: map['success'] as bool?,
      message: map['message'] is String?
          ? PermissionStatus.fromString(map['message'])
          : null,
      error: map['error'] as String?,
    );
  }
}
