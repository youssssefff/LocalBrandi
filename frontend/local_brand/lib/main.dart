import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/screens/bag_screen.dart';
import 'package:local_brand/screens/favourite_screen.dart';
import 'package:local_brand/screens/home_screen.dart';
import 'package:local_brand/screens/login_screen.dart';
import 'package:local_brand/screens/product_screen.dart';
import 'package:local_brand/screens/profile_screen.dart';
import 'package:local_brand/screens/shop_screen.dart';
import 'package:local_brand/screens/sign_up_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Open Sans', // Specify your desired font family here
        errorColor: Color(0xFFFF7F0E),
      ),
      home: const LoginScreen(),
    );
  }
}
