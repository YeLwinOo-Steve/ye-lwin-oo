import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:yelwinoo/injection.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import 'firebase_options.dart';
import 'presentation/route/routes.dart';
import 'presentation/utils/custom_scroll_behaviour.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Injection.setUp();
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
