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
    apiKey: 'AIzaSyDqCSwXw7NbdTQA4lekCjIDxHYCxxDM2Mw',
    appId: '1:565732616998:web:284548d70aec87ced12fe7',
    messagingSenderId: '565732616998',
    projectId: 'crash-detection-a6f5a',
    authDomain: 'crash-detection-a6f5a.firebaseapp.com',
    databaseURL: 'https://crash-detection-a6f5a-default-rtdb.firebaseio.com',
    storageBucket: 'crash-detection-a6f5a.appspot.com',
    measurementId: 'G-W20ER2KHBN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRu32S10xXbnDogBSsUqLdvMUO5MNRq2I',
    appId: '1:565732616998:android:9a1e174d33483eb5d12fe7',
    messagingSenderId: '565732616998',
    projectId: 'crash-detection-a6f5a',
    databaseURL: 'https://crash-detection-a6f5a-default-rtdb.firebaseio.com',
    storageBucket: 'crash-detection-a6f5a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGZTp_HhVRJRL3-CYKTwv0iYXN2gTE8Ko',
    appId: '1:565732616998:ios:64fea94bc5f0f691d12fe7',
    messagingSenderId: '565732616998',
    projectId: 'crash-detection-a6f5a',
    databaseURL: 'https://crash-detection-a6f5a-default-rtdb.firebaseio.com',
    storageBucket: 'crash-detection-a6f5a.appspot.com',
    androidClientId: '565732616998-l1suhe8h8l60ppbncndalq0sce48ipu3.apps.googleusercontent.com',
    iosClientId: '565732616998-43nvh274c60ckbhvh8g09nn9geohippd.apps.googleusercontent.com',
    iosBundleId: 'com.example.temp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGZTp_HhVRJRL3-CYKTwv0iYXN2gTE8Ko',
    appId: '1:565732616998:ios:8a50f42ea7ae8d81d12fe7',
    messagingSenderId: '565732616998',
    projectId: 'crash-detection-a6f5a',
    databaseURL: 'https://crash-detection-a6f5a-default-rtdb.firebaseio.com',
    storageBucket: 'crash-detection-a6f5a.appspot.com',
    androidClientId: '565732616998-l1suhe8h8l60ppbncndalq0sce48ipu3.apps.googleusercontent.com',
    iosClientId: '565732616998-b7vr3f2ki3j23gt0lgbo7cmcghjdgcl6.apps.googleusercontent.com',
    iosBundleId: 'com.example.temp.RunnerTests',
  );
}
