// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBFeCQ_dTsnWLAXKzcmWVtR5IYz2pGSuNw',
    appId: '1:767617498222:web:2ec9e97f7c952dca2f3a7f',
    messagingSenderId: '767617498222',
    projectId: 'retracestack',
    authDomain: 'retracestack.firebaseapp.com',
    storageBucket: 'retracestack.appspot.com',
    measurementId: 'G-KSX6N9Y1P9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQyMEJ0mKIO8mnFVfWatv42QiTt9WcIOI',
    appId: '1:767617498222:android:13bbf386d61172a12f3a7f',
    messagingSenderId: '767617498222',
    projectId: 'retracestack',
    storageBucket: 'retracestack.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVifb7TiMt58DRhHX4WuDz9fZLN2m3mL0',
    appId: '1:767617498222:ios:bdb2eab79e0fa9a42f3a7f',
    messagingSenderId: '767617498222',
    projectId: 'retracestack',
    storageBucket: 'retracestack.appspot.com',
    androidClientId: '767617498222-l2d9e8tbq2qijuj68ov7itug31o1reuk.apps.googleusercontent.com',
    iosClientId: '767617498222-bu40vo29veqg945tk4kudbfrf3nm8s8m.apps.googleusercontent.com',
    iosBundleId: 'com.everythingstack.retrace',
  );
}
