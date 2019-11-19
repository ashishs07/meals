import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryItemScreens extends StatelessWidget {
  static const routeName = '/categoryPage';

  final List<Meal> availableMeals;

  CategoryItemScreens(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['categoryTitle'];
    final categoryId = routeArgs['categoryId'];
    final filteredMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: filteredMeals[index].id,
            title: filteredMeals[index].title,
            imageUrl: filteredMeals[index].imageUrl,
            duration: filteredMeals[index].duration,
            complexity: filteredMeals[index].complexity,
            affordability: filteredMeals[index].affordability,
          );
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}
