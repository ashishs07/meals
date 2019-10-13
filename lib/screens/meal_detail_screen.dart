import 'package:flutter/material.dart';

import '../widgets/Simpler/info_bar.dart';
import '../dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealDetailPage';

  Widget buildTextContainer(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.all(6),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
        appBar: AppBar(title: Text(selectedMeal.title)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InfoBar(
                duration: selectedMeal.duration,
                complexity: selectedMeal.complexity,
                affordability: selectedMeal.affordability,
              ),
              buildTextContainer(context, 'Ingredients'),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 150,
                width: 300,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildTextContainer(context, 'Steps'),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                height: 200,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          softWrap: true,
                        ),
                      ),
                      Divider(thickness: 3),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              )
            ],
          ),
        ));
  }
}