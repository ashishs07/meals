import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';
import './Simpler/info_bar.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  void submitTap(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => submitTap(context),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                _buildCardImage(),
                _buildTextOnImage(),
              ],
            ),
            InfoBar(
              duration: duration,
              complexity: complexity,
              affordability: affordability,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardImage() {
    return ClipRRect(
      child: Image.network(
        imageUrl,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    );
  }

  Widget _buildTextOnImage() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        softWrap: true,
        overflow: TextOverflow.fade,
      ),
      color: Colors.black54,
    );
  }
}
