import 'package:flutter/material.dart';
import 'package:flutter_rive_tab/play_one_shot_animation.dart';

//
//
// ContentView.Flutter
// Spotify
//
// Flutter Rive
//
// Created by: Faiz Rhm

// Mark: Github
// Faiz Rhm
// https://github.com/Faiz-rhm


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
      home: const PlayOneShotAnimation()
    );
  }
}
