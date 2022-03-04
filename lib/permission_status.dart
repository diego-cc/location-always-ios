abstract class LocationPermissionStatusIOS {
  static const String authorizedAlways = 'authorizedAlways';
  static const String authorizedWhenInUse = 'authorizedWhenInUse';
  static const String authorized = 'authorized';
  static const String restricted = 'restricted';
  static const String denied = 'denied';
  static const String notDetermined = 'notDetermined';

  static String? fromString(String? status) {
    switch (status) {
      case LocationPermissionStatusIOS.authorizedAlways:
        return 'Always';
      case LocationPermissionStatusIOS.authorizedWhenInUse:
        return 'While using the app';
      case LocationPermissionStatusIOS.authorized:
        return 'Authorized';
      case LocationPermissionStatusIOS.restricted:
        return 'Ask next time or when I share';
      case LocationPermissionStatusIOS.denied:
        return 'Never';
      case LocationPermissionStatusIOS.notDetermined:
        return 'Not determined';
      default:
        return status;
    }
  }
}
