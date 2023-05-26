import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';

import 'presentation/utils/custom_scroll_behaviour.dart';
import 'presentation/views/home/home_page.dart';

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
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        primaryColor: kPrimary,
        focusColor: kPrimary,
        scaffoldBackgroundColor: kPrimary,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kDark,
            ),
        appBarTheme: AppBarTheme(
          toolbarHeight: kToolbarHeight + 30,
          elevation: 0.0,
          backgroundColor: kPrimary,
          foregroundColor: kDark,
        ),
      ),
      home: const HomePage(),
    );
  }
}
