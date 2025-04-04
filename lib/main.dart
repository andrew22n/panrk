
// ignore_for_file: avoid_print

import 'package:course_app/firebase_options.dart';
import 'package:course_app/screens/home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PANRK',
      theme: ThemeData(
        
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: FutureBuilder(future: _initialization, builder: 
      (context, snapshot){
        if(snapshot.hasError){
          print("Error"); 
        } if(snapshot.connectionState == ConnectionState.done){
          return const HomeScreen();
        } return const CircularProgressIndicator();

      }
      ),
    );
  }
}

