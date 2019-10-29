import 'package:flutter/material.dart';

import './screens/category_screens.dart';
import './screens/category_item_screens.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (ctx) => TabsScreen(),
        CategoryItemScreens.routeName: (ctx) => CategoryItemScreens(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryScreens());
      },
    );
  }
}
