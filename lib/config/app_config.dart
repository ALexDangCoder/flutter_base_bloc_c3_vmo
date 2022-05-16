import 'package:clean_architechture/firebase/firebase_options_staging.dart'
    as staging;
import 'package:clean_architechture/firebase/firebase_options_dev.dart' as dev;
import 'package:clean_architechture/firebase/firebase_options.dart' as prod;

import 'package:firebase_core/firebase_core.dart';

enum AppFlavor {
  dev,
  staging,
  production,
}

class AppConfig {
  final String apiBaseUrl;
  final AppFlavor appFlavor;

  AppConfig({
    required this.apiBaseUrl,
    required this.appFlavor,
  });

  static AppConfig? _instance;

  static AppConfig devConfig = AppConfig(
    apiBaseUrl: 'https://api.dev2.setel.my/api/',
    appFlavor: AppFlavor.dev,
  );

  static AppConfig stagingConfig = AppConfig(
    apiBaseUrl: 'https://api.staging2.setel.my/api/',
    appFlavor: AppFlavor.staging,
  );

  static AppConfig productionConfig = AppConfig(
    apiBaseUrl: 'https://api.prod.setel.my/api/',
    appFlavor: AppFlavor.production,
  );

  FirebaseOptions get flavorFirebaseOption {
    switch (_instance?.appFlavor) {
      case AppFlavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case AppFlavor.staging:
        return staging.DefaultFirebaseOptions.currentPlatform;
      case AppFlavor.production:
        return prod.DefaultFirebaseOptions.currentPlatform;
      default:
        return dev.DefaultFirebaseOptions.currentPlatform;
    }
  }

  static AppConfig? getInstance({String? flavorName}) {
    if (_instance == null) {
      switch (flavorName) {
        case 'dev':
          {
            _instance = devConfig;
          }
          break;
        case 'staging':
          {
            _instance = stagingConfig;
          }
          break;
        case 'production':
          {
            _instance = productionConfig;
          }
          break;
      }
      return _instance;
    }
    return _instance;
  }
}
