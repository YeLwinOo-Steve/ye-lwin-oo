import 'package:flutter/material.dart';

import 'presentation/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ye-Lwin-Oo',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.white,
        focusColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: kToolbarHeight + 30,
          elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}