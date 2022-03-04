import Flutter
import UIKit
import CoreLocation

public class SwiftLocationAlwaysIosPlugin: NSObject, FlutterPlugin, CLLocationManagerDelegate {
  var locationManager: CLLocationManager?
  var authorisationStatus: CLAuthorizationStatus = .notDetermined
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "location_always_ios", binaryMessenger: registrar.messenger())
    let instance = SwiftLocationAlwaysIosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  func response(success: Bool, message: String? = nil, error: String? = nil) -> [String:Any?] {
    return [
      "success": success,
      "message": message,
      "error": error
    ]
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if (locationManager == nil) {
          locationManager = CLLocationManager()
          locationManager?.delegate = self
      }

      switch (call.method) {
          case "requestLocationWhenInUsePermission":
              locationManager?.requestWhenInUseAuthorization()
              result(response(success: true))
              break
          case "requestLocationAlwaysPermission":
              // Beware: you CANNOT request this permission without granting "when in use" first
              if (authorisationStatus != .authorizedWhenInUse && authorisationStatus != .authorizedAlways) {
                result(response(success: false, error: "\"Location When In Use\" has not been granted yet."))
              } else {
                locationManager?.requestAlwaysAuthorization()
                result(response(success: true))
              }
              break
          case "fetchLocationPermissionStatus":
              switch(authorisationStatus) {
                case .authorizedAlways:
                  result(response(success: true, message: "authorizedAlways"))
                  break
                case .authorizedWhenInUse:
                  result(response(success: true, message: "authorizedWhenInUse"))
                case .authorized:
                  result(response(success: true, message: "authorized"))
                  break
                case .restricted:
                  result(response(success: true, message: "restricted"))
                case .denied:
                  result(response(success: true, message: "denied"))  
                case .notDetermined:
                  result(response(success: true, message: "notDetermined"))
                default:
                  result(response(success: false, error: "Unknown authorisation status: \(String(describing: authorisationStatus))"))
              }
              break
          default:
              result(FlutterMethodNotImplemented)
      }
  }

  @available(iOS 14, *)
  public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
      authorisationStatus = manager.authorizationStatus
  }

  public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
      authorisationStatus = status
  }
}
