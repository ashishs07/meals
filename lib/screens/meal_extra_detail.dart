import 'package:flutter/material.dart';

class MealExtraDetail extends StatelessWidget {
  final String title;
  final String sub;
  final Widget mealIngredients;

  MealExtraDetail(this.mealIngredients, this.title, this.sub);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$sub: $title'),
        ),
        body: mealIngredients);
  }
}
