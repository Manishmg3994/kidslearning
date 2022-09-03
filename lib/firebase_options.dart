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
    apiKey: 'AIzaSyB-EV02tHE29JLPTjQ4AUlfTKahu2zRjuE',
    appId: '1:180717943773:web:83ece34c69e94216d71434',
    messagingSenderId: '180717943773',
    projectId: 'kidslearning3994',
    authDomain: 'kidslearning3994.firebaseapp.com',
    storageBucket: 'kidslearning3994.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC34GvuiTRJJbQWP4Yl6lghi1_y5rz9yng',
    appId: '1:180717943773:android:048bbc41b3a68cf7d71434',
    messagingSenderId: '180717943773',
    projectId: 'kidslearning3994',
    storageBucket: 'kidslearning3994.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOissyfYWAdZMvhtbRo9krQlJSOzXxUt4',
    appId: '1:180717943773:ios:1163a2243ea453c6d71434',
    messagingSenderId: '180717943773',
    projectId: 'kidslearning3994',
    storageBucket: 'kidslearning3994.appspot.com',
    iosClientId: '180717943773-5603cepqhg5eisavjqmhgam92d199lq0.apps.googleusercontent.com',
    iosBundleId: 'com.antinna.kidslearning',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOissyfYWAdZMvhtbRo9krQlJSOzXxUt4',
    appId: '1:180717943773:ios:1163a2243ea453c6d71434',
    messagingSenderId: '180717943773',
    projectId: 'kidslearning3994',
    storageBucket: 'kidslearning3994.appspot.com',
    iosClientId: '180717943773-5603cepqhg5eisavjqmhgam92d199lq0.apps.googleusercontent.com',
    iosBundleId: 'com.antinna.kidslearning',
  );
}