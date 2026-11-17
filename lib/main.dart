import 'package:flutter/material.dart';
import 'package:stepik_17_6/page/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home: UserPage(),
    );
  }
}