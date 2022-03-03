abstract class PermissionStatus {
  static const String authorizedAlways = 'authorizedAlways';
  static const String authorizedWhenInUse = 'authorizedWhenInUse';
  static const String authorized = 'authorized';
  static const String restricted = 'restricted';
  static const String denied = 'denied';
  static const String notDetermined = 'notDetermined';

  static String? fromString(String? status) {
    switch (status) {
      case PermissionStatus.authorizedAlways:
        return 'Always';
      case PermissionStatus.authorizedWhenInUse:
        return 'While using the app';
      case PermissionStatus.authorized:
        return 'Authorized';
      case PermissionStatus.restricted:
        return 'Ask next time or when I share';
      case PermissionStatus.denied:
        return 'Never';
      case PermissionStatus.notDetermined:
        return 'Not determined';
      default:
        return status;
    }
  }
}
