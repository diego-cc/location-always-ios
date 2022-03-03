import 'dart:async';

import 'package:flutter/services.dart';
import 'package:location_always_ios/request_result.dart';

class LocationAlwaysIos {
  static const MethodChannel _channel = MethodChannel('location_always_ios');

  static Future<RequestResult> requestLocationWhenInUsePermission() async {
    try {
      final result = await _channel.invokeMethod(
        'requestLocationWhenInUsePermission',
      );
      return RequestResult.fromMap(Map<String, dynamic>.from(result));
    } catch (err) {
      return RequestResult(
        success: false,
        error: 'Could not complete request: $err',
      );
    }
  }

  static Future<RequestResult> requestLocationAlwaysPermission() async {
    try {
      final result = await _channel.invokeMethod(
        'requestLocationAlwaysPermission',
      );
      return RequestResult.fromMap(Map<String, dynamic>.from(result));
    } catch (err) {
      return RequestResult(
        success: false,
        error: 'Could not complete request: $err',
      );
    }
  }

  static Future<RequestResult> fetchLocationPermissionStatus() async {
    try {
      final result = await _channel.invokeMethod(
        'fetchLocationPermissionStatus',
      );
      return RequestResult.fromMap(Map<String, dynamic>.from(result));
    } catch (err) {
      return RequestResult(
        success: false,
        error: 'Could not complete request: $err',
      );
    }
  }
}
