import 'package:flutter/material.dart';
import 'package:meals/screens/category_item_screens.dart';

class CategoryItem extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color categoryColor;

  CategoryItem({
    @required this.categoryId,
    @required this.categoryTitle,
    @required this.categoryColor,
  });

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: categoryColor,
      gradient: LinearGradient(
        colors: [categoryColor.withOpacity(0.7), categoryColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: _buildBoxDecoration(),
      ),
      onTap: () => Navigator.of(context)
          .pushNamed(CategoryItemScreens.routeName, arguments: {
        'categoryTitle': categoryTitle,
        'categoryId': categoryId
      }),
      splashColor: categoryColor,
      borderRadius: BorderRadius.circular(15),
    );
  }
}
