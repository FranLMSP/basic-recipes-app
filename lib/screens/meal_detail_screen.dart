import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final meal = (ModalRoute.of(context).settings.arguments as Map<String, Meal>)['meal'];
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Center(
        child: Text(meal.title),
      ),
    );
  }
}