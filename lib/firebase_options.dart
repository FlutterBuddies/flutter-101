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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBnysDwDT-tHc3yiGxokYowXmxvDpEVGqE',
    appId: '1:51101438767:web:8e9dcc0f128755d36307da',
    messagingSenderId: '51101438767',
    projectId: 'flutter-firestore-shopping',
    authDomain: 'flutter-firestore-shopping.firebaseapp.com',
    storageBucket: 'flutter-firestore-shopping.appspot.com',
    measurementId: 'G-YP9JC9ZBQ2',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAi03vGFpI7auyuo5uraJv-IJzBYynmSIk',
    appId: '1:51101438767:ios:2608654323cd8d786307da',
    messagingSenderId: '51101438767',
    projectId: 'flutter-firestore-shopping',
    storageBucket: 'flutter-firestore-shopping.appspot.com',
    iosClientId: '51101438767-emq1qu2i77ac902iijjblhvk3mpu314i.apps.googleusercontent.com',
    iosBundleId: 'com.example.cupertinoStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAi03vGFpI7auyuo5uraJv-IJzBYynmSIk',
    appId: '1:51101438767:ios:bffe452852ab4e716307da',
    messagingSenderId: '51101438767',
    projectId: 'flutter-firestore-shopping',
    storageBucket: 'flutter-firestore-shopping.appspot.com',
    iosClientId: '51101438767-jtl9gc8gdid9ru69nhjf283fr7fcf2gj.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );
}