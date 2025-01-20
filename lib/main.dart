import 'package:attandance_app/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      // data diambil dari file google-services.json
      apiKey: 'AIzaSyDU6Y_-GrgZDJOH8oAjAkzEtCMxTsWm6ZQ', // current_key
      appId: '1:338285521766:android:10fb891af601da76d736a7', // mobilesdk_app_id
      messagingSenderId: '338285521766', // project_number
      projectId: 'attandance-app-50d81' // project_id
      ),
  ); // klo mau make layanan dri firebase, kita harus manggil initialize app dulu.
  runApp(const AttandanceApp());
}

class AttandanceApp extends StatelessWidget {
  const AttandanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData (
        cardTheme: const CardTheme(surfaceTintColor: Colors.white),
        dialogTheme: const DialogTheme(surfaceTintColor: Colors.white, backgroundColor: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }
}