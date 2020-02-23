import 'package:flutter/material.dart';

import '../../models/meal.dart';

class InfoBar extends StatelessWidget {
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  InfoBar({
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildRow(Icons.schedule, '$duration mins'),
          buildRow(Icons.work, complexityText),
          buildRow(Icons.attach_money, affordabilityText),
        ],
      ),
    );
  }

  Widget buildRow(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}
