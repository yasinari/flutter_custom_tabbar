import 'package:flutter/material.dart';
import 'package:flutter_custom_tabbar/example/first_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom TabBar',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: const FirstExample(),
    );
  }
}
