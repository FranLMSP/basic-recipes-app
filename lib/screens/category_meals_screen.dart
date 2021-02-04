import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const ROUTE_NAME = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

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
    _meals = widget.availableMeals.where((meal) {
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
          return MealItem(_meals[index]);
        },
        itemCount: _meals.length,
      ),
    );
  }
}