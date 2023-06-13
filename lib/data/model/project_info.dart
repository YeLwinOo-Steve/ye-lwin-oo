import 'package:flutter/material.dart';

class ProjectInfo {
  final IconData icon;
  final String label;
  bool? isTag;
  final List<String> contents;
  ProjectInfo({
    required this.icon,
    required this.label,
    required this.contents,
    this.isTag = false,
  });
}
