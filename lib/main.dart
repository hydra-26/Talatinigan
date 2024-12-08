import 'package:flutter/material.dart';
// import 'package:talatinigan/screens/settings_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talatinigan',
      home: HomeScreen(),
    );
  }
}
