import 'package:flutter/foundation.dart';

// the "enum" is for storage constant variables /////////////////////////////////
enum Complexity {
  Simple,
  Challenging,
  Hard,
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
  final List<String> steps;
  final List<String> ingredients;
  final int duration;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final bool isGlutenFree;
  final Complexity complexity;
  final Affordability affordability;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.categories,
    @required this.steps,
    @required this.ingredients,
    @required this.duration,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.isLactoseFree,
    @required this.isGlutenFree,
    @required this.complexity,
    @required this.affordability,
  });
}
