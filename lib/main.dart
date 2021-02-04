import 'package:flutter/material.dart';

import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: const Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: const TextStyle(
            color: const Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: CategoriesScreen(),
      // initialRoute: '/',
      routes: {
        '/': (context) => CategoriesScreen(),
        CategoryMealsScreen.ROUTE_NAME: (context) => CategoryMealsScreen(),
        MealDetailScreen.ROUTE_NAME: (context) => MealDetailScreen(),
      },
      /* onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      }, */
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },

    );
  }
}