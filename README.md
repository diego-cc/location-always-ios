# location_always_ios

This Flutter plugin requests the location permission "Always" on iOS and retrieves this permission's status.

https://user-images.githubusercontent.com/50987412/156553668-758389fc-a206-492a-9ef6-e590f7f8df3c.mp4


## Setting up

Make sure you have added the following keys to your `Info.plist` before installing this plugin:

- __NSLocationUsageDescription__
- __NSLocationWhenInUseUsageDescription__
- __NSLocationAlwaysUsageDescription__
- __NSLocationAlwaysAndWhenInUseUsageDescription__

You can find an example in the `example/ios/Runner/Info.plist` file.

## Installation

Add the following lines to the `dependencies` section of your `pubspec.yaml` file:

```yaml
location_always_ios:
    git:
      url: https://github.com/diego-cc/location-always-ios
      ref: main
```

## Usage

## Return type structure

Every method call in this plugin returns a `RequestResult` so that it's easier to map responses from method channels and handle possible errors.

This is how it's been structured:

```json
{
  "success": "bool",
  "message": "String?",
  "error": "String?" 
}
```

## Fetching the current location permission status

```dart
final RequestResult result = await LocationAlwaysIos.fetchLocationPermissionStatus();
```

The status will be returned from `message`, which can be one of:

- `authorizedAlways`
- `authorizedWhenInUse`
- `authorized`
- `restricted`
- `denied`
- `notDetermined`

These are the exact same statuses mapped natively from [`CLAuthorizationStatus`]("https://developer.apple.com/documentation/corelocation/clauthorizationstatus" "CLAuthorizationStatus").

## Requesting location "When in use"

```dart
final RequestResult result = await LocationAlwaysIos.requestLocationWhenInUsePermission();
```

## Requesting location "Always"

```dart
final RequestResult result = await LocationAlwaysIos.requestLocationAlwaysPermission();
```
