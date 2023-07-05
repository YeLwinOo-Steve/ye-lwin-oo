import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/views/wrapper.dart';

class ExperienceView extends StatefulWidget {
  const ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  @override
  Widget build(BuildContext context) {
    return const Wrapper(
      page: Center(
        child: Text('Experience'),
      ),
    );
  }
}
