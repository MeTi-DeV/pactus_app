import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pactus_app/screens/main_screen.dart';
import 'package:window_size/window_size.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    
    setWindowTitle('My App');
    // setWindowMaxSize(const Size(1024, 768));
    setWindowMinSize(const Size(1024, 768));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainScreen()
    );
  }
}

