import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/filters.dart';
import './models/meal.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filters _filters;
  List<Meal> _availableMeals = DUMMY_MEALS;

  @override
  void initState() {
    super.initState();
    _filters = Filters();
  }

  void _setFilters(Filters filters) {
    setState(() {
      _filters = filters.copy();
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters.glutenFree && !meal.isGlutenFree) {
          return false;
        }
        if(_filters.lactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if(_filters.vegetarian && !meal.isVegetarian) {
          return false;
        }
        if(_filters.vegan && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.ROUTE_NAME: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.ROUTE_NAME: (context) => MealDetailScreen(),
        FiltersScreen.ROUTE_NAME: (context) => FiltersScreen(_filters, _setFilters),
      },
      /* onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      }, */
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => TabsScreen());
      },

    );
  }
}