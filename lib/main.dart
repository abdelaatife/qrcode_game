import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/firebase_options.dart';

import 'package:gdsc/views/screens/grcodescanner.dart';
import 'package:gdsc/views/screens/loggin.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics =
        FirebaseAnalytics.instance;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr Code Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirebaseAuth.instance.currentUser ==
              null
          ? const Login()
          : const QrCodeScanner(),
    );
  }
}
