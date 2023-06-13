import 'package:flutter/material.dart';

class TechStack extends StatefulWidget {
  const TechStack({super.key});

  @override
  State<TechStack> createState() => _TechStackState();
}

class _TechStackState extends State<TechStack> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Tech Stack'),
    );
  }
}
