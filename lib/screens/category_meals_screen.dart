import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const ROUTE_NAME = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  List<Meal> _meals = [];
  String _categoryTitle;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Category>;
    final category = routeArgs['category'];

    _categoryTitle = category.title;
    _meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      _meals.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(_meals[index], _removeMeal);
        },
        itemCount: _meals.length,
      ),
    );
  }
}