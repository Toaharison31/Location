import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
//import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

void main() {
  // Raha tsy Android (aide)
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isLinux || Platform.isWindows || Platform.isMacOS){
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Mamerina ilay screens
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}
