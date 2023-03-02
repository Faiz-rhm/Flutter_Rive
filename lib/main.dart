import 'package:flutter/material.dart';
import 'package:flutter_rive_tab/light_switch.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Rive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LightSwitch()
    );
  }
}
