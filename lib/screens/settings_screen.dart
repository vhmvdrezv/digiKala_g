import 'package:flutter/material.dart';
import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListTile(title: Text('Logout'), onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()))),
    );
  }
}