import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location_always_ios/location_always_ios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _showDialog({
    required BuildContext context,
    String? title,
    String? content,
    String? buttonText,
    Future<void>? Function()? buttonAction,
  }) async {
    await showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(title ?? 'Error'),
        content: Text(content ?? 'Could not complete request.'),
        actions: [
          CupertinoDialogAction(
            child: Text(buttonText ?? 'OK'),
            onPressed: () async {
              if (buttonAction != null) {
                await buttonAction();
              }

              if (Navigator.canPop(ctx)) {
                Navigator.pop(ctx);
              }
            },
          )
        ],
      ),
    );
  }

  Future<void> requestLocationWhenInUse(BuildContext context) async {
    final requestResult =
        await LocationAlwaysIos.requestLocationWhenInUsePermission();

    if (requestResult.success != true) {
      await _showDialog(
        context: context,
        content: requestResult.error,
      );
    }
  }

  Future<void> requestLocationAlways(BuildContext context) async {
    final requestResult =
        await LocationAlwaysIos.requestLocationAlwaysPermission();

    if (requestResult.success != true) {
      await _showDialog(
        context: context,
        content: requestResult.error,
      );
    }
  }

  Future<void> fetchPermissionStatus(BuildContext context) async {
    final permissionResult =
        await LocationAlwaysIos.fetchLocationPermissionStatus();

    if (permissionResult.success == true) {
      await _showDialog(
        context: context,
        title: 'Permission Status',
        content: '${permissionResult.message}',
      );
    } else {
      await _showDialog(
        context: context,
        content: '${permissionResult.error}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: CupertinoPageScaffold(
          backgroundColor: const Color.fromRGBO(
            73,
            78,
            92,
            1.0,
          ),
          navigationBar: const CupertinoNavigationBar(
            backgroundColor: Color.fromRGBO(
              37,
              83,
              219,
              1.0,
            ),
            middle: Text(
              'Location Always iOS - Example',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          child: Builder(
            builder: (ctx) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async => await requestLocationWhenInUse(ctx),
                    child: const Text(
                      'Request location when in use',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: ElevatedButton(
                      onPressed: () async => await requestLocationAlways(ctx),
                      child: const Text(
                        'Request location always',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: ElevatedButton(
                      onPressed: () async => await fetchPermissionStatus(ctx),
                      child: const Text(
                        'Fetch permission status',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
