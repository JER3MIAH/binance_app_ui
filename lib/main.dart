import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/pages/home_page.dart';
import 'package:food_delivery_app/ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: lightTheme,
      home: const HomePage(),
    );
  }
}
