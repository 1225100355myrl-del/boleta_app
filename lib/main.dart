import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const BoletaApp());
}

class BoletaApp extends StatelessWidget {
  const BoletaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boleta Escolar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SplashScreen(),
    );
  }
}
