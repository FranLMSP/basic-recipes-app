import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String description;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.description = '',
    this.color = Colors.orange,
  });
}