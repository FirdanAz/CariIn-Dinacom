import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lowongan_pekerjaan/login_page.dart';
import 'firebase_options.dart';
import 'home_page.dart';

Future<void> main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: LoginPage(),
    );
  }
}

