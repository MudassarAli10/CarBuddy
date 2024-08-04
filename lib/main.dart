import 'package:ecomerence_app/app.dart';
import 'package:ecomerence_app/data/repository/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecomerence_app/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Add Binding Widget
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Getx Init Local Storage
  await GetStorage.init();
  //Init Payment Method

  //Await Native Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Initilize Firebase & Initilize Authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // Load Design ,Themes
  runApp(const App());
}
