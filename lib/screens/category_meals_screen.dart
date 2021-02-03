import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const ROUTE_NAME = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, Category>;
    final category = routeArgs['category'];
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('The recipes for the category!'),
      ),
    );
  }
}