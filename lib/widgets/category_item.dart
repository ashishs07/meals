import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color categoryColor;

  CategoryItem({
    @required this.categoryId,
    @required this.categoryTitle,
    @required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: categoryColor,
          gradient: LinearGradient(
            colors: [categoryColor.withOpacity(0.7), categoryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed('/categorypage', arguments: {
        'categoryTitle': categoryTitle,
        'categoryId': categoryId
      }),
      splashColor: categoryColor,
      borderRadius: BorderRadius.circular(15),
    );
  }
}
