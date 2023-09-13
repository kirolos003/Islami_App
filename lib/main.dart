import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/shared/components.dart';

import 'UI/Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2) , (){
      navigateTo(context , HomeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/splash.png',
                width: double.infinity,
                height: double.infinity, // Set the height to fill the screen
                fit: BoxFit.cover, // Optional: Adjust the image's fit as needed
              ),
            )
          ],
        ),
      ),
    );
  }
}
