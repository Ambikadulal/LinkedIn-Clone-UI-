import 'package:flutter/material.dart';
import 'package:linkedin_ui/view/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LinkedIn Clone-UI',
      home: SplashScreen(),
    );
  }
}
