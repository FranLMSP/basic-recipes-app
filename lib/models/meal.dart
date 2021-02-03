import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
  Expert,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple: return 'Simple';
      case Complexity.Challenging: return 'Challenging';
      case Complexity.Hard: return 'Hard';
      case Complexity.Expert: return 'Expert';
      default: return '';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable: return 'Affordable';
      case Affordability.Pricey: return 'Pricey';
      case Affordability.Luxurious: return 'Luxurious';
      default: return '';
    }
  }

  const Meal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.categories,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}