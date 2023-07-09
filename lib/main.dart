import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import 'presentation/route/routes.dart';
import 'presentation/utils/custom_scroll_behaviour.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yelwinoo',
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: context.theme(),
      initialRoute: initialRoute,
      onGenerateRoute: RouteGen.generateRoute,
    );
  }
  String get initialRoute => Routes.home;
}
