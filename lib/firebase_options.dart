// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDGiwhxpBkq_6zmKYXLNLWlMMNlmJVaqkY',
    appId: '1:605041616343:web:bdbeddaece1fb79a2f5792',
    messagingSenderId: '605041616343',
    projectId: 'zoom-3a9b8',
    authDomain: 'zoom-3a9b8.firebaseapp.com',
    storageBucket: 'zoom-3a9b8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhUvtavDk03ThplDWVgvtcI0Ti5wTpdy8',
    appId: '1:605041616343:android:0341ae9e56ea53bc2f5792',
    messagingSenderId: '605041616343',
    projectId: 'zoom-3a9b8',
    storageBucket: 'zoom-3a9b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCaFKyCTiX6S1JXCI8Ya-BDAQEPyn5TTn4',
    appId: '1:605041616343:ios:f0e2c6d001cda3102f5792',
    messagingSenderId: '605041616343',
    projectId: 'zoom-3a9b8',
    storageBucket: 'zoom-3a9b8.appspot.com',
    iosClientId: '605041616343-hqgjoh1lsfb425hnpt795p8korf8u9r0.apps.googleusercontent.com',
    iosBundleId: 'com.example.zoomApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCaFKyCTiX6S1JXCI8Ya-BDAQEPyn5TTn4',
    appId: '1:605041616343:ios:f0e2c6d001cda3102f5792',
    messagingSenderId: '605041616343',
    projectId: 'zoom-3a9b8',
    storageBucket: 'zoom-3a9b8.appspot.com',
    iosClientId: '605041616343-hqgjoh1lsfb425hnpt795p8korf8u9r0.apps.googleusercontent.com',
    iosBundleId: 'com.example.zoomApp',
  );
}
