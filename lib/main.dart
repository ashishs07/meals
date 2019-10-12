import 'package:flutter/material.dart';

import './screens/category_screens.dart';
import './screens/category_item_screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Color.fromRGBO(52, 131, 235, 1),
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
        '/': (ctx) => CategoryScreens(),
        '/categorypage': (ctx) => CategoryItemScreens(),
      },
    );
  }
}
