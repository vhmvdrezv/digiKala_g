import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Welcome to Shop', style: TextStyle(fontSize: 24))));
  }
}