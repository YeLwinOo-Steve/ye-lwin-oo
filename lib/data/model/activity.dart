import 'package:flutter/material.dart';

class Activity {
  String? title;
  final String name;
  String? link;
  final IconData icon;
  final String details;
  Activity({
    this.title,
    required this.name,
    required this.icon,
    this.link,
    required this.details,
  });
}
