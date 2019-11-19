import 'package:flutter/material.dart';

import './dummy-data.dart';
import './models/meal.dart';

import './screens/category_screens.dart';
import './screens/category_item_screens.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _filterUpdate(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    setState(() {
      final existingIndex =
          _favouriteMeals.indexWhere((meal) => meal.id == mealId);

      if (existingIndex >= 0) {
        _favouriteMeals.removeAt(existingIndex);
      } else {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    });
  }

  bool _isFavorite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Karla',
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryItemScreens.routeName: (ctx) =>
            CategoryItemScreens(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavourite, _isFavorite),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(_filters, _filterUpdate),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreens());
      },
    );
  }
}
