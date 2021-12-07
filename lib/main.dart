import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  runApp(App());
}
