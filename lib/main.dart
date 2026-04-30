import 'package:flutter/material.dart';
import 'presentation/screens/home/home_screen.dart'; // Apne folder path ke hisaab se check karein

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ApnaTractor',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true, // Modern UI ke liye zaroori hai
      ),
      // Yahan HomeScreen ko home property mein dena zaroori hai
      home: const HomeScreen(), 
    );
  }
}