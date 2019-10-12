import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy-data.dart';

class CategoryItemScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['categoryTitle'];
    final categoryId = routeArgs['categoryId'];
    final filteredMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: filteredMeals[index].title,
              imageUrl: filteredMeals[index].imageUrl,
              duration: filteredMeals[index].duration,
              complexity: filteredMeals[index].complexity,
              affordability: filteredMeals[index].affordability,
            );
          },
          itemCount: filteredMeals.length,
        ));
  }
}
